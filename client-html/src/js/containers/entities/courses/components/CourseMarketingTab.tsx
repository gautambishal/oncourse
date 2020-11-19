/*
 * Copyright ish group pty ltd. All rights reserved. https://www.ish.com.au
 * No copying or use of this code is allowed without permission in writing from ish.
 */

import React, { useCallback, useMemo } from "react";
import { connect } from "react-redux";
import { Dispatch } from "redux";
import { change, FieldArray } from "redux-form";
import Grid from "@material-ui/core/Grid";
import { Sale, SaleType } from "@api/model";
import DocumentsRenderer from "../../../../common/components/form/documents/DocumentsRenderer";
import { FormEditorField } from "../../../../common/components/markdown-editor/FormEditor";
import { State } from "../../../../reducers/state";
import { clearSales, getSales } from "../../sales/actions";
import NestedList, { NestedListItem } from "../../../../common/components/form/nestedList/NestedList";
import { getPlainCourses, setPlainCourses, setPlainCoursesSearch } from "../actions";
import { entityForLink } from "../../common/utils";
import { Classes } from "../../../../model/entities/CourseClass";

const transform = (sale: Sale): NestedListItem => ({
    id: sale.id.toString(),
    entityId: sale.entityToId ? sale.entityToId : sale.entityFromId,
    entityName: sale.type,
    primaryText: sale.name,
    secondaryText: sale.code,
    link: sale.type === SaleType.Class ?
        `/${Classes.path}?search=id is ${sale.entityToId ? sale.entityToId : sale.entityFromId}` :
        `/${entityForLink(sale.type)}/${sale.entityToId ? sale.entityToId : sale.entityFromId}`,
    active: typeof sale.active === "boolean" ? sale.active : true
});

const salesSort = (a, b) => (a.name.toLowerCase() > b.name.toLowerCase() ? 1 : -1);

const CourseMarketingTab: React.FC<any> = props => {
  const {
    twoColumn,
    classes,
    dispatch,
    form,
    showConfirm,
    values,
    sales,
    getSearchResult,
    clearSearchResult,
    pending,
    submitSucceeded,
    courses,
    coursesPending,
    setCoursesSearch,
    getCourses,
    clearCoursesSearch
  } = props;

  const onDeleteAll = useCallback(() => {
    dispatch(change(form, "relatedlSalables", []));
  }, [form]);

  const onDelete = useCallback(
    (saleToDelete: NestedListItem) => {
      dispatch(
        change(
          form,
          "relatedlSalables",
          values.relatedlSalables.filter(
            sale => sale.id !== saleToDelete.entityId || sale.type !== saleToDelete.entityName
          )
        )
      );
    },
    [form, values.relatedlSalables]
  );

  const onAdd = useCallback(
    (salesToAdd: NestedListItem[]) => {
      const salesCombined = (sales || []).concat(courses || []);

      const newSalesList = values.relatedlSalables.concat(
        salesToAdd.map(v1 => salesCombined.find(v2 => v2.id === v1.entityId && v2.type === v1.entityName))
      );

      newSalesList.sort(salesSort);
      dispatch(change(form, "relatedlSalables", newSalesList));
    },
    [form, sales, courses, values.relatedlSalables]
  );

  const searchCourses = useCallback(search => {
    setCoursesSearch(search);
    getCourses();
  }, []);

  const listValues = useMemo(() => (values && values.relatedlSalables ? values.relatedlSalables.map(transform) : []), [
    values.relatedlSalables
  ]);

  const searchValues = useMemo(() => [...(sales ? sales.map(transform) : []), ...courses.map(transform)], [
    sales,
    courses
  ]);

  return (
    <Grid container className="pl-3 pr-3">
      <Grid item xs={12}>
        <div className="heading mt-2 mb-2">Marketing</div>
      </Grid>

      <Grid item xs={12}>
        <FormEditorField name="webDescription" label="Web description" />
      </Grid>

      <Grid item xs={12} className="pb-3">
        <FieldArray
          name="documents"
          label="Documents"
          entity="Course"
          classes={classes}
          component={DocumentsRenderer}
          xsGrid={12}
          mdGrid={twoColumn ? 4 : 12}
          lgGrid={twoColumn ? 3 : 12}
          dispatch={dispatch}
          form={form}
          showConfirm={showConfirm}
          rerenderOnEveryChange
        />
      </Grid>

      <Grid item xs={twoColumn ? 8 : 12}>
        <NestedList
          title={`${listValues.length} Related courses / products`}
          searchPlaceholder="Find products"
          additionalSearchPlaceholder="Find courses"
          formId={values.id}
          values={listValues}
          searchValues={searchValues}
          pending={pending || coursesPending}
          onAdd={onAdd}
          onDelete={onDelete}
          onDeleteAll={onDeleteAll}
          onSearch={getSearchResult}
          onAdditionalSearch={searchCourses}
          clearSearchResult={clearSearchResult}
          clearAdditionalSearchResult={clearCoursesSearch}
          sort={salesSort}
          resetSearch={submitSucceeded}
          dataRowClass={classes.dataRowClass}
          aqlEntity="Product"
          additionalAqlEntity="Course"
          additionalAqlEntityTags={["Course"]}
        />
      </Grid>
    </Grid>
  );
};

const mapStateToProps = (state: State) => ({
  sales: state.sales.items,
  pending: state.sales.pending,
  courses: state.courses.items,
  coursesPending: state.courses.loading
});

const mapDispatchToProps = (dispatch: Dispatch<any>) => ({
    getSearchResult: (search: string) => {
      if (search) {
        dispatch(getSales(search));
      }
    },
    clearSearchResult: (pending: boolean) => dispatch(clearSales(pending)),
    getCourses: (offset?: number) => dispatch(getPlainCourses(offset, null, true)),
    setCoursesSearch: (search: string) => dispatch(setPlainCoursesSearch(search)),
    clearCoursesSearch: (loading?: boolean) => {
      dispatch(setPlainCourses([], null, null, loading));
    }
  });

export default connect<any, any, any>(mapStateToProps, mapDispatchToProps)(CourseMarketingTab);