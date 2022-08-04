using { capm_retail.db as db } from '../db/data-model';

service CatalogService @(requires: 'authenticated-user')
{
    entity Computers as
        projection on db.Computers;

    entity Customers as
        projection on db.Customers;

    @odata.draft.enabled
    entity Sales as
        projection on db.Sales;

    @readonly
    entity sales_overview as
        projection on db.sales_overview;
}
