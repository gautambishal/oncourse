import { generateArraysOfRecords } from "../../mockUtils";
import { AccountType } from "@api/model";

export function mockAccountTransactions() {
  this.getAccountTransactions = () => {
    return this.accountTransactions;
  };

  this.getAccountTransaction = id => {
    const row = this.accountTransactions.rows.find(row => row.id == id);
    return {
      id: row.id,
      transactionDate: row.values[0],
      fromAccount: row.values[1],
      amount: row.values[4],
      toAccount: null
    };
  };

  this.createAccountTransaction = item => {
    const data = JSON.parse(item);
    const accountTransactions = this.accountTransactions;
    const totalRows = accountTransactions.rows;

    data.id = totalRows.length + 1;

    accountTransactions.rows.push({
      id: data.id,
      values: [data.transactionDate, data.fromAccount, data.amount, data.toAccount]
    });

    this.accountTransactions = accountTransactions;
  };

  this.removeAccountTransaction = id => {
    this.accountTransactions = this.accountTransactions.rows.filter(a => a.id !== id);
  };

  const rows = generateArraysOfRecords(20, [
    { name: "id", type: "number" },
    { name: "transactionDate", type: "Datetime" },
    { name: "fromAccount", type: "number" },
    { name: "amount", type: "Money" }
  ]).map(l => ({
    id: l.id,
    values: [l.transactionDate, l.fromAccount, "Deposited funds", AccountType.asset, l.amount, "Payment in line"]
  }));

  const columns = [
    {
      title: "Date",
      attribute: "transactionDate",
      sortable: true,
      visible: true,
      width: 200,
      type: "Datetime",
      sortFields: []
    },
    {
      title: "Account code",
      attribute: "account.accountCode",
      sortable: true,
      visible: true,
      width: 100,
      type: null,
      sortFields: []
    },
    {
      title: "Account description",
      attribute: "account.description",
      sortable: true,
      visible: true,
      width: 200,
      type: null,
      sortFields: []
    },
    {
      title: "Account type",
      attribute: "account.type",
      sortable: false,
      visible: true,
      width: 100,
      type: null,
      sortFields: []
    },
    {
      title: "Amount",
      attribute: "amount",
      sortable: true,
      visible: true,
      width: 200,
      type: "Money",
      sortFields: []
    },
    {
      title: "Source",
      attribute: "tableName",
      sortable: true,
      visible: true,
      width: 100,
      type: null,
      sortFields: []
    }
  ];

  const response = { rows, columns } as any;

  response.entity = "AccountTransaction";
  response.offset = 0;
  response.filterColumnWidth = 200;
  response.layout = "Three column";
  response.pageSize = 20;
  response.search = "( (tableName == 'I') or (tableName == 'P' or tableName == 'O') )";
  response.count = rows.length;
  response.filteredCount = rows.length;
  response.sort = [{ attribute: "transactionDate", ascending: true, complexAttribute: [] }];

  return response;
}