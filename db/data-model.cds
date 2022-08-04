namespace capm_retail.db;

using { managed } from '@sap/cds/common';

entity Computers
{
    key ID : Integer;
    name : String;
	model : String;
	unitprice: Integer;
    stock : Integer;
};

entity Customers
{
    key ID : Integer;
    name : String(100);
    address : String(100);
    phone : String(100);
}

entity Sales : managed
{
    key ID : UUID
        @Core.Computed;
    customerID : Integer;
    computerID : Integer;
    price: Decimal;
}

entity sales_overview as
    select key sal.ID as salesID,
    sal.customerID as customerID,
    cust.name as customerName,
    cust.phone as customerPhone,
    cust.address as customerAddress,
    comp.ID as computerID,
    comp.name as computerName,
    comp.model as computerModel,
    sal.price as salesAmount
    from Sales as sal 
    left join Customers as cust on cust.ID = sal.customerID
    left join Computers as comp on comp.ID = sal.computerID;