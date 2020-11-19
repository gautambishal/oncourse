@parallel=false
Feature: Main feature for all POST requests with path 'list/entity/contact/merge'

    Background: Authorize first
        * callonce read('../../../../signIn.feature')
        * url 'https://127.0.0.1:8182/a/v1'
        * def ishPath = 'list/entity/contact/merge'
        * def ishPathContact = 'list/entity/contact'
        * def ishPathLogin = 'login'
        * configure httpClientClass = 'ish.oncourse.api.test.client.KarateClient'



    Scenario: (+) Merge student/tutor and student/tutor

        * def mergeRequest =
        """
        {"contactA":"21","contactB":"22","data":{"Contact.abn":"B","Contact.birthDate":"B","Contact.email":"B","Contact.fax":"B","Contact.firstName":"B","Contact.homePhone":"B","Contact.honorific":"B","Contact.invoiceTerms":"B","Contact.isMale":"B","Contact.lastName":"B","Contact.message":"B","Contact.middleName":"B","Contact.mobilePhone":"B","Contact.postcode":"B","Contact.state":"B","Contact.street":"B","Contact.suburb":"B","Contact.tfn":"B","Contact.title":"B","Contact.workPhone":"B","Contact.taxOverride":"B","Contact.country":"B","Student.studentNumber":"B","Student.chessn":"B","Student.citizenship":"B","Student.clientIndustryEmployment":"B","Student.clientOccupationIdentifier":"B","Student.disabilityType":"B","Student.englishProficiency":"B","Student.feeHelpEligible":"B","Student.highestSchoolLevel":"B","Student.indigenousStatus":"B","Student.isOverseasClient":"B","Student.isStillAtSchool":"B","Student.labourForceStatus":"B","Student.medicalInsurance":"B","Student.passportNumber":"B","Student.priorEducationCode":"B","Student.specialNeeds":"B","Student.specialNeedsAssistance":"B","Student.townOfBirth":"B","Student.uniqueLearnerIndentifier":"B","Student.visaExpiryDate":"B","Student.visaNumber":"B","Student.visaType":"B","Student.yearSchoolCompleted":"B","Student.countryOfBirth":"B","Student.countryOfResidency":"B","tags":"B","customField.cf2":"B","customField.cf1":"B","Tutor.dateFinished":"B","Tutor.dateStarted":"B","Tutor.payrollRef":"B","Tutor.resume":"B","Tutor.wwChildrenCheckedOn":"B","Tutor.wwChildrenExpiry":"B","Tutor.wwChildrenRef":"B","Tutor.wwChildrenStatus":"B"}}
        """

        Given path ishPath
        And request mergeRequest
        When method POST
        Then status 200
        And match $ == 21

#       <---> Assertion:
        Given path ishPathContact + '/21'
        When method GET
        Then status 200
        And match $ contains
        """
        {
        "id":21,
        "student":
            {"id":15,"countryOfBirth":{"id":2,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"United States of America","saccCode":null},"disabilityType":"Mental illness","labourForceStatus":"Unemployed seeking full time","englishProficiency":"Not Well","highestSchoolLevel":"Year 10","indigenousStatus":"Neither","isOverseasClient":false,"isStillAtSchool":false,"language":null,"priorEducationCode":"Certificate I","specialNeeds":"BBB","yearSchoolCompleted":null,"studentNumber":16,"countryOfResidency":{"id":3,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"Poland","saccCode":null},"visaNumber":null,"visaType":null,"visaExpiryDate":null,"passportNumber":null,"medicalInsurance":null,"uniqueLearnerIdentifier":"bbb","usi":"2222222222","usiStatus":"Not supplied","chessn":null,"feeHelpEligible":false,"citizenship":"No information","townOfBirth":"b","specialNeedsAssistance":false,"clientIndustryEmployment":"Retail Trade (G)","clientOccupationIdentifier":"Not Stated","waitingLists":[],"concessions":[{"id":1001,"number":"2","type":{"id":2,"name":"Student","requireExpary":false,"requireNumber":false,"allowOnWeb":true,"created":"#ignore","modified":"#ignore"},"expiresOn":"2024-10-01","created":"#ignore","modified":"#ignore"},{"id":1002,"number":"5","type":{"id":3,"name":"Pensioner","requireExpary":false,"requireNumber":false,"allowOnWeb":true,"created":"#ignore","modified":"#ignore"},"expiresOn":"2019-09-12","created":"#ignore","modified":"#ignore"}]},
        "tutor":
            {
            "id":7,
            "dateFinished":"2026-10-07",
            "dateStarted":"2019-08-08",
            "familyNameLegal":null,
            "givenNameLegal":null,
            "payrollRef":"222",
            "resume":"Resume B",
            "wwChildrenCheckedOn":null,
            "wwChildrenExpiry":"2026-10-15",
            "wwChildrenRef":"222",
            "wwChildrenStatus":"Not checked",
            "currentClassesCount":1,
            "futureClasseCount":0,
            "selfPacedclassesCount":0,
            "unscheduledClasseCount":0,
            "passedClasseCount":0,
            "cancelledClassesCount":0
            },
        "abn":"222",
        "birthDate":"1999-05-05",
        "country":{"id":2,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"United States of America","saccCode":null},
        "fax":"b",
        "isCompany":false,
        "gender":"Male",
        "message":"message B",
        "homePhone":"b",
        "mobilePhone":"444662211",
        "workPhone":"b",
        "postcode":"5001",
        "state":"SB",
        "street":"address str2",
        "suburb":"Adelaide2",
        "tfn":"222",
        "deliveryStatusEmail":"#number",
        "deliveryStatusSms":"#number",
        "deliveryStatusPost":0,
        "allowPost":true,
        "allowSms":true,
        "allowEmail":true,
        "uniqueCode":"mGrSMxFbd9Ma7ESw",
        "honorific":"b",
        "title":"sB",
        "email":"merge2@gmail.com",
        "firstName":"studentB",
        "lastName":"mergeB",
        "middleName":"B",
        "invoiceTerms":22,
        "taxId":1,
        "customFields":{"cf1":"bb","cf2":"b"},
        "documents":
            [
            {"attachedRecordsCount":"#ignore","id":201,"name":"defaultPublicDocument","versionId":null,"added":"2019-02-14T13:41:08.499Z","tags":[],"thumbnail":null,"versions":[{"id":201,"added":"2019-02-14T13:41:08.499Z","createdBy":null,"fileName":null,"mimeType":null,"size":"21 b","url":null,"thumbnail":null}],"description":"Public description","access":"Public","shared":true,"createdOn":"#ignore","modifiedOn":"#ignore","removed":false,"attachmentRelations":"#ignore"},
            {"attachedRecordsCount":"#ignore","id":200,"name":"defaultPrivateDocument","versionId":null,"added":"2019-02-14T13:40:12.639Z","tags":[],"thumbnail":null,"versions":[{"id":200,"added":"2019-02-14T13:40:12.639Z","createdBy":null,"fileName":null,"mimeType":null,"size":"22 b","url":null,"thumbnail":null}],"description":"Private description","access":"Private","shared":true,"createdOn":"#ignore","modifiedOn":"#ignore","removed":false,"attachmentRelations":"#ignore"}
            ],
        "tags":[{"id":234,"name":"contacts2","status":null,"system":null,"urlPath":null,"content":null,"color":null,"weight":null,"taggedRecordsCount":null,"childrenCount":null,"created":null,"modified":null,"requirements":[],"childTags":[]}],
        "memberships":
            [
            {"id":1011,"name":"Membership for mergeA","code":null,"active":null,"type":"Membership","expiryDate":"2020-01-01"},
            {"id":1012,"name":"Membership for mergeB","code":null,"active":null,"type":"Membership","expiryDate":"2020-01-01"}
            ],
        "profilePicture":null,
        "relations":[{"id":"#number","contactFromId":null,"contactFromName":null,"contactToId":26,"contactToName":"tutorC mergeC","relationId":-1}],
        "financialData":
            [
            {"relatedEntityId":17,"type":"PaymentIn","description":"Cash payment payment in (office)","date":"2019-09-20","createdOn":"2019-09-20T13:57:10.310Z","referenceNumber":null,"status":"Success","owing":null,"amount":260.00,"balance":-260.00},
            {"relatedEntityId":29,"type":"Invoice","description":"Invoice (office)","date":"2019-09-20","createdOn":"2019-09-20T13:57:10.400Z","referenceNumber":"30","status":"Success","owing":0.00,"amount":260.00,"balance":0.00},
            {"relatedEntityId":18,"type":"PaymentIn","description":"Cash payment payment in (office)","date":"2019-09-20","createdOn":"2019-09-20T13:58:09.201Z","referenceNumber":null,"status":"Success","owing":null,"amount":300.00,"balance":-300.00},
            {"relatedEntityId":30,"type":"Invoice","description":"Invoice (office)","date":"2019-09-20","createdOn":"2019-09-20T13:58:09.207Z","referenceNumber":"31","status":"Success","owing":0.00,"amount":300.00,"balance":0.00},
            {"relatedEntityId":19,"type":"PaymentIn","description":"Cash payment payment in (office)","date":"2019-09-20","createdOn":"2019-09-20T13:58:45.890Z","referenceNumber":null,"status":"Success","owing":null,"amount":165.00,"balance":-165.00},
            {"relatedEntityId":31,"type":"Invoice","description":"Invoice (office)","date":"2019-09-20","createdOn":"2019-09-20T13:58:45.892Z","referenceNumber":"32","status":"Success","owing":0.00,"amount":165.00,"balance":0.00}
            ],
        "createdOn":"#ignore",
        "modifiedOn":"#ignore",
        "messages":
            [
            {"messageId":1006,"createdOn":"2019-09-20T11:23:52.427Z","sentOn":null,"subject":"a","creatorKey":null,"status":"Queued","type":"Email"},
            {"messageId":1007,"createdOn":"2019-09-20T11:24:07.706Z","sentOn":null,"subject":"b","creatorKey":null,"status":"Queued","type":"Email"},
            {"messageId":1013,"createdOn":"2019-09-20T11:27:41.805Z","sentOn":null,"subject":"a","creatorKey":null,"status":"Queued","type":"Email"}
            ],
        "rules":[{"id":"1001","description":"bbbbb-bb","startDate":"2019-09-20","endDate":"2019-10-01","startDateTime":null,"endDateTime":null,"repeat":"year","repeatEnd":"never","repeatEndAfter":null,"repeatOn":null,"created":"#ignore","modified":"#ignore"}]
        }
        """

        Given path ishPathContact + '/22'
        When method GET
        Then status 400
        And match $.errorMessage == "Record with id = '22' doesn't exist."



    Scenario: (+) Merge student and tutor

        * def mergeRequest = {"contactA":"23","contactB":"26","data":{"Contact.birthDate":"A","Contact.email":"A","Contact.firstName":"A","Contact.isMale":"A","Contact.lastName":"A","Contact.mobilePhone":"A","Contact.postcode":"A","Contact.state":"A","Contact.street":"A","Contact.suburb":"A","Contact.country":"A","tags":"A"}}

        Given path ishPath
        And request mergeRequest
        When method POST
        Then status 200
        And match $ == 23

#       <---> Assertion:
        Given path ishPathContact + '/23'
        When method GET
        Then status 200
        And match $ contains
        """
        {
        "id":23,
        "student":{"id":17,"countryOfBirth":null,"disabilityType":"Not stated","labourForceStatus":"Not stated","englishProficiency":"Not stated","highestSchoolLevel":"Not stated","indigenousStatus":"Not stated","isOverseasClient":false,"isStillAtSchool":false,"language":null,"priorEducationCode":"Not stated","specialNeeds":null,"yearSchoolCompleted":null,"studentNumber":17,"countryOfResidency":null,"visaNumber":null,"visaType":null,"visaExpiryDate":null,"passportNumber":null,"medicalInsurance":null,"uniqueLearnerIdentifier":null,"usi":"3333333333","usiStatus":"Not supplied","chessn":null,"feeHelpEligible":false,"citizenship":"No information","townOfBirth":null,"specialNeedsAssistance":false,"clientIndustryEmployment":"Not Stated","clientOccupationIdentifier":"Not Stated","waitingLists":[],"concessions":[]},
        "tutor":{"id":6,"dateFinished":null,"dateStarted":null,"familyNameLegal":null,"givenNameLegal":null,"payrollRef":null,"resume":null,"wwChildrenCheckedOn":null,"wwChildrenExpiry":null,"wwChildrenRef":null,"wwChildrenStatus":"Not checked","currentClassesCount":0,"futureClasseCount":0,"selfPacedclassesCount":1,"unscheduledClasseCount":0,"passedClasseCount":0,"cancelledClassesCount":0},
        "abn":null,
        "birthDate":"1995-05-06",
        "country":{"id":1,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"Australia","saccCode":null},
        "fax":null,
        "isCompany":false,
        "gender":"Male",
        "message":null,
        "homePhone":null,
        "mobilePhone":"444662212",
        "workPhone":null,
        "postcode":"5000",
        "state":"SA",
        "street":"address str",
        "suburb":"Adelaide",
        "tfn":null,
        "deliveryStatusEmail":0,
        "deliveryStatusSms":0,
        "deliveryStatusPost":0,
        "allowPost":true,
        "allowSms":true,
        "allowEmail":true,
        "uniqueCode":"mGySMxFbd9Ma7ESw",
        "honorific":null,
        "title":null,
        "email":"merge3@gmail.com",
        "firstName":"studentC",
        "lastName":"mergeC",
        "middleName":null,
        "invoiceTerms":null,
        "taxId":null,
        "customFields":{},
        "documents":[],
        "tags":[],
        "memberships":
            [
            {"id":1013,"name":"Membership for mergeB","code":null,"active":null,"type":"Membership","expiryDate":"2020-01-01"},
            {"id":1014,"name":"Membership for mergeA","code":null,"active":null,"type":"Membership","expiryDate":"2020-01-01"}
            ],
        "profilePicture":null,
        "relations":
            [
            {"id":"#number","contactFromId":null,"contactFromName":null,"contactToId":28,"contactToName":"mergeCompanyB","relationId":1},
            {"id":"#number","contactFromId":21,"contactFromName":"#string","contactToId":null,"contactToName":null,"relationId":-1},
            {"id":"#number","contactFromId":24,"contactFromName":"tutorA mergeA","contactToId":null,"contactToName":null,"relationId":1},
            {"id":"#number","contactFromId":27,"contactFromName":"mergeCompanyA","contactToId":null,"contactToName":null,"relationId":1}
            ],
        "financialData":
            [
            {"relatedEntityId":20,"type":"PaymentIn","description":"Cash payment payment in (office)","date":"2019-09-20","createdOn":"2019-09-20T13:59:38.975Z","referenceNumber":null,"status":"Success","owing":null,"amount":400.00,"balance":-400.00},
            {"relatedEntityId":32,"type":"Invoice","description":"Invoice (office)","date":"2019-09-20","createdOn":"2019-09-20T13:59:38.978Z","referenceNumber":"33","status":"Success","owing":0.00,"amount":400.00,"balance":0.00},
            {"relatedEntityId":21,"type":"PaymentIn","description":"Cash payment payment in (office)","date":"2019-09-20","createdOn":"2019-09-20T14:00:56.234Z","referenceNumber":null,"status":"Success","owing":null,"amount":231.00,"balance":-231.00},
            {"relatedEntityId":33,"type":"Invoice","description":"Invoice (office)","date":"2019-09-20","createdOn":"2019-09-20T14:00:56.235Z","referenceNumber":"34","status":"Success","owing":0.00,"amount":231.00,"balance":0.00}
            ],
        "createdOn":"#ignore",
        "modifiedOn":"#ignore",
        "messages":[],
        "rules":[]
        }
        """

        Given path ishPathContact + '/26'
        When method GET
        Then status 400
        And match $.errorMessage == "Record with id = '26' doesn't exist."



    Scenario: (+) Merge company and company

        * def mergeRequest = {"contactA":"27","contactB":"28","data":{"Contact.fax":"A","Contact.country":"A","Contact.abn":"A","Contact.email":"B","Contact.homePhone":"A","Contact.lastName":"B","Contact.message":"A","Contact.mobilePhone":"B","Contact.postcode":"A","Contact.state":"B","Contact.street":"A","Contact.suburb":"B","Contact.workPhone":"A","Contact.taxOverride":"B","tags":"A","customField.cf2":"B","customField.cf1":"A"}}

        Given path ishPath
        And request mergeRequest
        When method POST
        Then status 200
        And match $ == 27

#       <---> Assertion:
        Given path ishPathContact + '/27'
        When method GET
        Then status 200
        And match $ contains
        """
        {
        "id":27,
        "student":null,
        "tutor":null,
        "abn":"777",
        "birthDate":null,
        "country":{"id":1,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"Australia","saccCode":null},
        "fax":"444777124",
        "isCompany":true,
        "gender":null,
        "message":"some alert message8",
        "homePhone":"444777001",
        "mobilePhone":"444777789",
        "workPhone":"Co1",
        "postcode":"5008",
        "state":"SP",
        "street":"some Address 8",
        "suburb":"some Suburb 9",
        "tfn":null,
        "deliveryStatusEmail":2,
        "deliveryStatusSms":0,
        "deliveryStatusPost":0,
        "allowPost":true,
        "allowSms":true,
        "allowEmail":true,
        "uniqueCode":"vZYSUCSifRXchU2U",
        "honorific":null,
        "title":null,
        "email":"merge9@gmail.com",
        "firstName":null,
        "lastName":"mergeCompanyB",
        "middleName":null,
        "invoiceTerms":null,
        "taxId":2,
        "customFields":{"cf1":"Co1","cf2":"Co1"},
        "documents":[{"attachedRecordsCount":"#ignore","id":201,"name":"defaultPublicDocument","versionId":null,"added":"2019-02-14T13:41:08.499Z","tags":[],"thumbnail":null,"versions":[{"id":201,"added":"2019-02-14T13:41:08.499Z","createdBy":null,"fileName":null,"mimeType":null,"size":"21 b","url":null,"thumbnail":null}],"description":"Public description","access":"Public","shared":true,"createdOn":"#ignore","modifiedOn":"#ignore","removed":false,"attachmentRelations":"#ignore"}],
        "tags":[{"id":233,"name":"contacts1","status":null,"system":null,"urlPath":null,"content":null,"color":null,"weight":null,"taggedRecordsCount":null,"childrenCount":null,"created":null,"modified":null,"requirements":[],"childTags":[]}],
        "memberships":[],
        "profilePicture":null,
        "relations":
            [
            {"id":"#number","contactFromId":null,"contactFromName":null,"contactToId":23,"contactToName":"studentC mergeC","relationId":1},
            {"id":"#number","contactFromId":23,"contactFromName":"studentC mergeC","contactToId":null,"contactToName":null,"relationId":1}
            ],
        "financialData":[],
        "createdOn":"#ignore",
        "modifiedOn":"#ignore",
        "messages":
            [
            {"messageId":1011,"createdOn":"2019-09-20T11:26:28.106Z","sentOn":null,"subject":"co1","creatorKey":null,"status":"Queued","type":"Email"},
            {"messageId":1012,"createdOn":"2019-09-20T11:26:48.424Z","sentOn":null,"subject":"co2","creatorKey":null,"status":"Queued","type":"Email"}
            ],
        "rules":[{"id":"1003","description":"Co2","startDate":"2019-09-20","endDate":"2019-09-20","startDateTime":null,"endDateTime":null,"repeat":"month","repeatEnd":"onDate","repeatEndAfter":null,"repeatOn":"2019-08-01","created":"#ignore","modified":"#ignore"}]
        }
        """

        Given path ishPathContact + '/28'
        When method GET
        Then status 400
        And match $.errorMessage == "Record with id = '28' doesn't exist."



    Scenario: (-) Merge contacts by notadmin without access rights

#       <--->  Login as notadmin
        Given path '/logout'
        And request {}
        When method PUT
        * def loginBody = {login: 'UserWithRightsView', password: 'password', kickOut: 'true', skipTfa: 'true'}

        Given path '/login'
        And request loginBody
        When method PUT
        Then status 200
#       <--->
        * def mergeRequest = {}

        Given path ishPath
        And request mergeRequest
        When method POST
        Then status 403
        And match $.errorMessage == "Sorry, you have no permissions to merge contact. Please contact your administrator"



    Scenario: (+) Merge tutor and tutor by notadmin with access rights

#       <--->  Login as notadmin
        Given path '/logout'
        And request {}
        When method PUT
        * def loginBody = {login: 'UserWithRightsDelete', password: 'password', kickOut: 'true', skipTfa: 'true'}

        Given path '/login'
        And request loginBody
        When method PUT
        Then status 200
#       <--->

        * def mergeRequest = {"contactA":"24","contactB":"25","data":{"Contact.abn":"B","Contact.birthDate":"B","Contact.email":"B","Contact.fax":"B","Contact.firstName":"B","Contact.homePhone":"B","Contact.honorific":"B","Contact.invoiceTerms":"B","Contact.isMale":"B","Contact.lastName":"B","Contact.message":"B","Contact.mobilePhone":"B","Contact.postcode":"B","Contact.state":"B","Contact.street":"B","Contact.suburb":"B","Contact.tfn":"B","Contact.title":"B","Contact.workPhone":"B","Contact.taxOverride":"B","Contact.country":"B","tags":"B","customField.cf2":"B","customField.cf1":"B","Tutor.dateFinished":"B","Tutor.dateStarted":"B","Tutor.payrollRef":"B","Tutor.resume":"B","Tutor.wwChildrenCheckedOn":"B","Tutor.wwChildrenExpiry":"B","Tutor.wwChildrenRef":"B","Tutor.wwChildrenStatus":"B"}}

        Given path ishPath
        And request mergeRequest
        When method POST
        Then status 200
        And match $ == 24

#       <---> Assertion:
        Given path ishPathContact + '/24'
        When method GET
        Then status 200
        And match $ contains
        """
        {
        "id":24,
        "student":null,
        "tutor":
            {
            "id":4,
            "dateFinished":null,
            "dateStarted":null,
            "familyNameLegal":null,
            "givenNameLegal":null,
            "payrollRef":null,
            "resume":"tB",
            "wwChildrenCheckedOn":null,
            "wwChildrenExpiry":null,
            "wwChildrenRef":null,
            "wwChildrenStatus":"Not checked",
            "currentClassesCount":1,
            "futureClasseCount":1,
            "selfPacedclassesCount":0,
            "unscheduledClasseCount":0,
            "passedClasseCount":0,
            "cancelledClassesCount":0
            },
        "abn":null,
        "birthDate":"1972-05-06",
        "country":{"id":1,"isoCodeAlpha3":null,"isoCodeNumeric":null,"name":"Australia","saccCode":null},
        "fax":null,
        "isCompany":false,
        "gender":"Male",
        "message":null,
        "homePhone":null,
        "mobilePhone":"444555334",
        "workPhone":null,
        "postcode":"5004",
        "state":"SD",
        "street":"address str4",
        "suburb":"Adelaide4",
        "tfn":null,
        "deliveryStatusEmail":3,
        "deliveryStatusSms":0,
        "deliveryStatusPost":0,
        "allowPost":true,
        "allowSms":true,
        "allowEmail":true,
        "uniqueCode":"XykuWMd3zJ7KUX2n",
        "honorific":null,
        "title":"tB",
        "email":"merge5@gmail.com",
        "firstName":"tutorB",
        "lastName":"mergeB",
        "middleName":null,
        "invoiceTerms":66,
        "taxId":1,
        "customFields":{"cf2":"tB","cf1":"tB"},
        "documents":[{"attachedRecordsCount":"#ignore","id":200,"name":"defaultPrivateDocument","versionId":null,"added":"2019-02-14T13:40:12.639Z","tags":[],"thumbnail":null,"versions":[{"id":200,"added":"2019-02-14T13:40:12.639Z","createdBy":null,"fileName":null,"mimeType":null,"size":"22 b","url":null,"thumbnail":null}],"description":"Private description","access":"Private","shared":true,"createdOn":"#ignore","modifiedOn":"#ignore","removed":false,"attachmentRelations":"#ignore"}],
        "tags":[{"id":234,"name":"contacts2","status":null,"system":null,"urlPath":null,"content":null,"color":null,"weight":null,"taggedRecordsCount":null,"childrenCount":null,"created":null,"modified":null,"requirements":[],"childTags":[]}],
        "memberships":[],
        "profilePicture":null,
        "relations":[{"id":"#number","contactFromId":null,"contactFromName":null,"contactToId":23,"contactToName":"studentC mergeC","relationId":1}],
        "financialData":[],
        "createdOn":"#ignore",
        "modifiedOn":"#ignore",
        "messages":
            [
            {"messageId":1008,"createdOn":"2019-09-20T11:24:54.338Z","sentOn":null,"subject":"ta","creatorKey":null,"status":"Queued","type":"Email"},
            {"messageId":1009,"createdOn":"2019-09-20T11:25:42.930Z","sentOn":null,"subject":"tB","creatorKey":null,"status":"Queued","type":"Email"},
            {"messageId":1010,"createdOn":"2019-09-20T11:26:03.980Z","sentOn":null,"subject":"tb2","creatorKey":null,"status":"Queued","type":"Email"}
            ],
        "rules":[{"id":"1002","description":"tA","startDate":null,"endDate":null,"startDateTime":"2019-09-20T11:16:59.659Z","endDateTime":"2019-09-20T12:16:59.659Z","repeat":"week","repeatEnd":"never","repeatEndAfter":null,"repeatOn":null,"created":"#ignore","modified":"#ignore"}]}
        }
        """

        Given path ishPathContact + '/25'
        When method GET
        Then status 400
        And match $.errorMessage == "Record with id = '25' doesn't exist."
