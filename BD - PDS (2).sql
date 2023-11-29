create database bd_projeto_pds;
use bd_projeto_pds;


create table Cliente (
id_cli int primary key auto_increment,
nome_cli varchar(200) not null, 
endereco_cli varchar(150), 
telefone_cli varchar(45), 
cpf_cli varchar(45) 
);

insert into Cliente values (null, 'Carlem', 'Rua Menezes, n°89', '69992351680', '06641566226');
insert into Cliente values (null, 'Débora', 'Rua Tigrão, n°369', '69992351687', '06641566201');
insert into Cliente values (null, 'Maria', 'Rua São Cristovão, n°254', '69992351622', '06641566228');
insert into Cliente values (null, 'Eduarda', 'Rua Emanuel, n°811', '69992351611', '06641566222');
insert into Cliente values (null, 'Bruno', 'Rua Renascer, n°666', '69992351655', '06641566277');

create table Despesa (
id_des int primary key auto_increment,
tipo_des varchar(200), 
descricao_des varchar(1000),
forma_pagamento_des varchar(45), 
#parcela_des varchar(45), #Não coloquei no VS
valor_des double, 
status_des varchar(45), 
data_vencimento_des date
);

insert into Despesa values (null, 'Aluguel', 'Á vista', '1 parcela', 1000, 'Fechado', '2023-06-20');


create table Fornecedor (
id_for int primary key auto_increment, 
nome_for varchar(200), 
nome_fantasia_for varchar(300), 
razao_social_for varchar(200), 
email_for varchar(400), 
contato_for varchar(45),
cnpj_for varchar(45)
);

insert into Fornecedor values (null, 'Modas', 'Distribuidora Modas', 'Modas LTDA', 'modas@gmail.com', '34258974', '12345678910');
insert into Fornecedor values (null, 'Verão', 'Distribuidora Verão', 'Verão LTDA', 'verao@gmail.com', '34258922', '12345678922');
insert into Fornecedor values (null, 'Outono', 'Distribuidora Outono', 'Outono LTDA', 'outono@gmail.com', '34258944', '12345678911');
insert into Fornecedor values (null, 'Inverno', 'Distribuidora Inverno', 'Inverno LTDA', 'inverno@gmail.com', '34258999', '12345678933');
insert into Fornecedor values (null, 'Primavera', 'Distribuidora Primavera', 'Primavera LTDA', 'primavera@gmail.com', '34258955', '12345678966');

create table Empresa (
id_emp int primary key auto_increment, 
codigo_barras_emp varchar(45), 
categoria_emp varchar(200), 
tamanho_emp varchar(200), 
id_for_fk int, 
foreign key(id_for_fk) references Fornecedor (id_for)
);

insert into Empresa values (null, '01', 'Grande porte', '300mX200m', 5);
insert into Empresa values (null, '02', 'Grande porte', '300mX200m', 4);
insert into Empresa values (null, '03', 'Grande porte', '300mX200m', 3);
insert into Empresa values (null, '04', 'Grande porte', '300mX200m', 2);
insert into Empresa values (null, '05', 'Grande porte', '300mX200m', 1);

create  table Funcionario (
id_func int primary key auto_increment, 
nome_func varchar(200), 
telefone_func varchar(45), 
cpf_func varchar(45), 
rg_func varchar(45), 
endereco_func varchar(150), 
curriculo_func varchar(300), 
cargo_func varchar(100), 
salario_func double
);

insert into Funcionario values (null, 'Cléber', '69992435270', '78802270244', '1779329', 'Rua Tigrão, n°369', null, 'Vendedor', 3000);
insert into Funcionario values (null, 'Calebe', '69992435271', '78802270245', '1779321', 'Rua Cravos, n°361', null, 'Gerente', 4000);
insert into Funcionario values (null, 'Clarissa', '69992435272', '78802270246', '1779322', 'Rua Canela, n°362', null, 'Vendedora', 3000);
insert into Funcionario values (null, 'Caique', '69992435273', '78802270247', '1779324', 'Rua Goiaba, n°363', null, 'Administrador', 5000);
insert into Funcionario values (null, 'Cristina', '69992435274', '78802270248', '1779323', 'Rua Laranja, n°364', null, 'Financeira', 6000);

create table Entrega (
id_entr int primary key auto_increment, 
endereco_entr varchar(100), 
telefone_entr varchar(45), 
id_cli_fk int,
foreign key(id_cli_fk) references Cliente (id_cli),
id_func_fk int,
foreign key(id_func_fk) references Funcionario (id_func)
);

INSERT INTO entrega (endereco_entr, telefone_entr, id_cli_fk, id_func_fk) 
VALUES ( 'rua vassoura, n°22', '69992356892', 1, 1);


create table Caixa (
id_cai int primary key auto_increment,
forma_rec_pag_cai varchar(45), 
status_cai varchar(45), 
numero_cai int, 
#hora_abertura_cai datetime, NÃO SEI COMO COLOCAR NO WPF
#hora_fechamento_cai datetime, NÃO SEI COMO COLOCAR NO WPF
saldo_inicial_cai double, 
saldo_final_cai double, 
id_func_fk int,
foreign key(id_func_fk) references Funcionario (id_func)
); 

insert into Caixa values (null, 'Dinheiro', '2 parcelas', 5, 100, 3000, 5);

create table Pagamento (
id_pag int primary key auto_increment, 
tipo_pag varchar(45), 
descricao_pag varchar(1000),
forma_pagamento_pag varchar(45), 
valor_pag double,
status_pag varchar(45), 
#parcela_pag varchar(45), #Não coloquei essa no VS
data_vencimento_pag date,
data_pagamento_pag date, 
id_des_fk int, 
foreign key(id_des_fk) references Despesa (id_des), 
id_cai_fk int, 
foreign key(id_cai_fk) references Caixa (id_cai)
);

insert into Pagamento values (null, 'Aluguel', 'fcfvgf', 'a vista', 100, 'Fechado', '2023-04-05', '2023-04-03', 1, 1); 

create table Produto (
id_prod int primary key auto_increment, 
nome_prod varchar(200), 
tipo_prod varchar(200), 
valor_prod double,
tamanho_prod varchar(100), 
cor_prod varchar(200), 
classificacao_prod varchar(45), 
tipo_tecido_prod varchar(100), 
codigo_barras_prod varchar(100)
);

insert into Produto values (null, 'Calça', 'Jeans', 150, '36', 'Azul', 'Adulto', 'Jeans', null);
insert into Produto values (null, 'Blusa', 'Malha', 100, 'P', 'Colorido', 'Adulto', 'Malha', null);
insert into Produto values (null, 'Bermuda', 'Jeans', 125, '34', 'Preta', 'Adulto', 'Jeans', null);
insert into Produto values (null, 'Shorts', 'Jeans', 100, '38', 'Rosa', 'Adulto', 'Jeans', null);
insert into Produto values (null, 'Camisa', 'Jeans', 150, 'M', 'Verde', 'Adulto', 'Jeans', null);

Select * from Produto;


create table Compra (
id_com int primary key auto_increment,
nome_com varchar(200),
codigo_prod_com varchar(200), 
quantidade_prod_com int, 
valor_unitario_com double, 
valor_total_com double, 
data_com date,
id_for_fk int, 
foreign key(id_for_fk) references Fornecedor (id_for), 
id_func_fk int,
foreign key(id_func_fk) references Funcionario (id_func), 
id_des_fk int, 
foreign key(id_des_fk) references Despesa (id_des)
);



create table  Compra_Produto (
id_com_prod int primary key auto_increment, 
id_com_fk int, 
foreign key(id_com_fk) references Compra (id_com), 
id_prod_fk int, 
foreign key(id_prod_fk) references Produto (id_prod)
);

insert into Compra_Produto values (null, null, null);

create table Estoque (
id_est int primary key auto_increment, 
nome_est varchar(150), 
tipo_est varchar(100), 
quantidade_est int, 
id_prod_fk int, 
foreign key(id_prod_fk) references Produto (id_prod)
);

insert into Estoque values (null, 'Calça', 'Jeans', 5, 1);
insert into Estoque values (null, 'Blusa', 'Malha', 3, 2);
insert into Estoque values (null, 'Bermuda', 'Jeans', 2, 3);
insert into Estoque values (null, 'Shorts', 'Jeans', 4, 4);
insert into Estoque values (null, 'Camisa', 'Jeans', 1, 5);

create table Venda (
id_ven int primary key auto_increment, 
descricao_ven varchar(300),
codigo_ven varchar(100),
data_ven varchar(200), 
quantidade_ven int, 
valor_unitario_ven double,
forma_recebimento_ven varchar(50), 
#parcela_ven varchar(45), #Faltou essa
valor_total_ven double, 
id_func_fk int,
foreign key(id_func_fk) references Funcionario (id_func), 
id_cli_fk int, 
foreign key(id_cli_fk) references Cliente (id_cli)

);

insert into Venda values (null, 'dwgedwgf', '01', '2023-05-23', 1, 250,'Á vista', 250, 1, 1);

create table Venda_Produto (
id_ven_prod int primary key auto_increment, 
quantidade_ven_prod int,
valorTotal_ven_prod double,
id_ven_fk int, 
valor_ven_prod double,
foreign key(id_ven_fk) references Venda (id_ven), 
id_prod_fk int, 
foreign key(id_prod_fk) references Produto (id_prod)
);



create table Recebimento (
id_rec int primary key auto_increment, 
tipo_rec varchar(45), 
descricao_rec varchar(1000),
forma_recebimento_rec varchar(45), 
#parcela_rec varchar(45), #Não coloquei no VS
status_rec varchar(45), 
valor_rec double, 
data_recebimento_rec date, 
data_vencimento_rec date, 
id_ven_fk int, 
foreign key(id_ven_fk) references Venda (id_ven), 
id_cai_fk int, 
foreign key(id_cai_fk) references Caixa (id_cai)
);