describe ecommerce;
use ecommerce;
desc client; 

desc storagelocation;
desc productorder;

select * from storagelocation;

/*Para ser continuado desafio: termine implementar a tabela e crie a conexao com as tabelas necessárias, além disso, reflita essa modificação no diagrama do esquema relacional.*/

create table orders (
   idOrder int auto_increment primary key,
   idorderClient int, 
   orderSatus enum ('cacelado','confirmado','Em processamento','alimento') not null,
   orderDescripition varchar (255),
   senvalue float default 10,
   paymentcash bool default false,
constraint fk_ordem_client foreign key (idorderclient) references client (idClient));


   insert into orders values
    (default,1,'confirmado','1x Tênis Nike',10,'1');
    select * from orders;
	

/* Cria tabela de estoque*/
create table productStorage (
    idProductStorage int auto_increment primary key,
    storagLocation varchar (255),
    quantity int default 0 );

/* Cria tabela de fornecedor */
create table provider (
   idProvider int auto_increment primary key,
   name varchar (255) not null,
   companyName varchar (255) not null,
   CNPJ char (15) not null,
   CPF char (11) not null,
   Street varchar (50) not null,
   HouseNumber int not null,
   complement varchar (100) not null,
   district varchar (100) not null,
   city varchar (100) not null,
   State varchar (100) not null,
   email varchar (100) not null,
   site varchar (100) not null,
   facebook varchar (100) not null,
   fone int not null
   );
   
   alter table provider
   add constraint unique_provider unique(CNPJ);
   
   /*criar tabela vendedor*/
   create table seller (
    idSeller int auto_increment primary key,
    CorporateName varchar (255) not null,
    CNPJ char (15),
    CPF char (11),
    location varchar (255),
    contact char (11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF));
   
   create table procuctSeller (
      idseller int,
      idProduct int,
      prodQuantity int not null default 1,
      primary key (idSeller, idProduct),
      constraint fk_product_seller foreign key (idSeller)references seller (idSeller),
      constraint fk_product_product foreign key (idProduct) references product (idProduct));
      
   create table productOrder (
      idOProduct int,
      idOrder int,
      Quantity int default 1,
      pstatus enum ('Disponivel', 'sem estoque') default 'Disponível',
      primary key (idOProduct, idOrder),
      constraint fk_productorder_Product foreign key (idOProduct) references product (idProduct),
      constraint fk_productorder_Order foreign key (idOrder) references orders (idOrder)
  
      );
      
      
      desc product;
      select * from product;
      use product;
      
      show tables;
      delete from storagelocation;
      
      create table StorageLocation (
      idLproduct int,
      idLStorage int,
      location varchar (255) not null,
      primary key (idLproduct, idLStorage),
      constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
      constraint fk_storage_location_storage foreign key (idLStorage) references productstorage(idProductStorage)
      );
      
      create table productprovider (
      idPsProvider int,
      idPsProduct int,
      quantity int not null,
      primary key (idPsProvider, idPsProduct),
      constraint fk_product_provider foreign key (idPsProvider) references provider(idProvider),
      constraint fk_product_productprovider foreign key (idPsProduct) references product (idProduct)
      );
      
      drop table payments;
      
      create table if not exists payments (
      idPayments int auto_increment primary key,
      idPayOrders int,
      idPayproduct int,
      Typeofpayments enum('money','creditcard','ticket'),
      Amount float,
      paymentStatus enum ('Autrhorized', 'cancel','processing'),  
      constraint fk_pay_orders foreign key (idPayOrders) references orders (idOrder),
      constraint fk_pay_product foreign key (idPayproduct) references product (idProduct));
     
     insert into payments (idPayOrders,idPayproduct,Typeofpayments,Amount,paymentStatus)
     values (1,1,'money','1234','processing');
     select * from payments;
      
      alter table money auto_increment = 1;
      
      select * from payments;
      
      create table creditcard(
      idcreditcard int auto_increment primary key,
      idPaycreditcard int,
      creditcartflag varchar (30) not null,
      exprationdate date not null,
      cardholdername varchar (60),
      securitycode char (30) not null,
      constraint fk_credit foreign key (idPaycreditcard) references payments (idPayments));
      
      create table if not exists ticket (
      idticket int auto_increment primary key,
      idpayticket int,
      bankname varchar (50) not null,
      barcode varchar (50) not null,
      duedata date not null,
      constraint fk_pay_ticket foreign key (idpayticket) references payments(idPayments));
      
      create table money (
      idmoney int auto_increment primary key ,
      idpaymoney int,
      cash enum('pix','money'),
      constraint fk_pay_cash foreign key (idpaymoney) references payments(idPayments));
      
	insert into money (cash)
	values (1,'pix');
    
    select * from money;
      
	insert into ticket(bankname,barcode,duedata)
	values ('barra','222222222','2022-09-01');
	 
      insert into creditcard (creditcartflag,exprationdate,cardholdername,securitycode)
      values ('cartao','2022-09-01','tarciso','12');
      
      select * from creditcard;
      
      
      insert into client 
      (Fnome,Minit,Lname,CPF,Rua,Complemento,Numero,Bairro,Cidade,Estado) values
      
      ('Marconi','de','Souza','899989','mdmdm','baixo','12','jordao','paulista','pe');
	
select * from client;
insert into orders
      (idorderClient ,orderSatus, orderDescripition, senvalue, paymentcash) values
      
   ( 2,1,1,3,null);
   
 alter table product auto_increment = 1;
insert into product (Pname,Classification_kids,Category,CPF,Address,Avaliacao,size)
values
('carro',false,'brinquedo','22','Princesa','5','4');

   alter table productorder auto_increment = 1;
insert into product (idOProduct,idOrder,Quantity,pstatus)
values
('1','5','2',null)


desc payments;

use ecommerce;
select * from product;

select * from productstorage;

 alter table productstorage auto_increment = 1;
insert into product (storagLocation,quantity)
values
('Pernambuco',3330),
('Sao Paulo',123),
('Rio de Janeiro',303030);

 alter table storagelocation auto_increment = 1;
 
insert into storagelocation (idLproduct,idLStorage,location) values
(1,1,'rio de janeiro');

select * from storagelocation;

desc product;
select * from product;
desc storagelocation ;
desc productprovider;
desc productstorage;
select * from productstorage;
select * from storagelocation; 
select * from productprovider;
select * from productstorage;

insert into productstorage (storagLocation,quantity) values
 ('rio de janeiro', 1000),
 ('sao paulo', 2000),
 ('pernamuco',200);
 
 insert into provider (name,companyName,CNPJ,CPF,Street,HouseNumber,complement,district,city,State,email,site,facebook,fone) values
 ('Bompreço','o barato','125','124','Salmon','13','sem esquina','paratibe','paulista','sao paulo','lot','www','face','666666');
 select * from provider;
 select * from procuctseller;
 desc  procuctseller;
 desc procuctseller;
 insert into productprovider (idPsProvider,idPsProduct,quantity) values
 (2,1,200);
 desc seller;
 select * from seller;
 
 
  insert into procuctseller (idseller,idProduct,  prodQuantity                   ) values
  (1,1,10);
  
  insert into seller (CorporateName,CNPJ,CPF,location,contact) values
  ('bom','125','12342','lmar','123453');
  
  /*Selecionando da tabela Cliente*/
  
  select count(*) from client;
  
  
  select * from client c, orders o where c.idClient = idorderClient;
  
  
  select * from client c inner join orders o on c.idClient = o.idorderClient inner join productorder p on p.idOrder = o.idOrder;
  
  select count(*) from client c, orders o where c.idClient = idorderClient group by idOrder;
  
  select Fnome, Lname, idOrder, orderSatus from client c, orders o where c.idClient = idorderClient;

select concat(Fnome,'  ',Lname) as client, idOrder as Request, ordersatus as Status from client c, orders o where c.idClient = idorderClient;

  select * from client;
  select * from product;

  select Fnome, bairro, count(*)
  from client, productorder
  where idclient = idOProduct
  group by Fnome, bairro
  Having count(*) > 1;
  
  /*Classificando usando:*/
  select * from client order by Fnome, Lname; 
  
  /*Usando Join */
  select * from client join payments
  on idClient = idPayments;
  
  /*Pesquisando aonde tem a cidade de Paulista*/
  select  Fnome, Cidade, Bairro 
  from (client join product on idClient = idProduct)
  where Cidade = 'paulista';
  
  
  select * from client inner join product
  on idClient = idProduct;
  
  
  /*abaixo tem o mesmo resultado*/
  select * from client left join product
  on idProduct = idClient;
  
  select * from client left outer join product
  on idProduct = idClient;
  
  
	create table CNPJ(
		idClientCNPJ int auto_increment primary key,
		idCClientCNPJ int not null,
		companyName varchar(50) not null,
		CNPJ char(14) not null,
		tradingName varchar(50) not null,
		address varchar(255) not null,
		contact char(12),
		email varchar(50) not null,

		constraint fk_clientcnpj foreign key(idCClientCNPJ) references Client(idClient));
        
	    insert into cnpj
        values (1,1,'tatatta',67889, 'O armazem 2000','Rua do Imperdor ', 112111119,'armazem2000o@gmail.com'),
	   (2,2,'Carolina',4858595, 'Pizaaria', 'Avenida das Americas', 211111119,'casadasmarcas@hotmail.com');
       select * from cnpj;
        
        
	   create table CPF(
         idClientCPF int auto_increment primary key,
         idCClientCPF int not null,
         Fname varchar(15) not null,
         Minit varchar(5) not null,
        Lname varchar(30) not null,
         CPF char(11) not null,
         Bdate date not null,
        address varchar(255) not null,
        contact char(11),
         email varchar(50) not null,

        constraint fk_clientcpf foreign key(idCClientCPF) references Client(idClient));
        
        INSERT INTO CPF
      values (2,2,'Belo','B','Santos',99999999,'1999-08-09','Rua Canoa, 980, Pernambuco ',999999991,'Pernambuco@hotmail.com');
      select * from cpf;
        




  