# Comandos ->

A chave é uma combinação de colunas usada para indexar e recuperar dados de forma eficiente

## CASSANDRA ->

```bash
docker exec -it cassandra-db cqlsh -f ./scripts/cassandra-setup.cql
```

- Entrar no Cassandra:

```bash
docker exec -it cassandra-db cqlsh
```

### Cassandra's Queries ->

```sql
-- Consulta 1: Obter total de vendas por cliente
SELECT customer_id, SUM(quantity) AS total_quantity, SUM(price * quantity) AS total_sales FROM testkeyspace.sales WHERE sale_date >= '2023-10-01' AND sale_date <= '2023-10-31' GROUP BY customer_id ALLOW FILTERING;
```

```sql
-- Consulta 2: Obter produtos vendidos em um intervalo de datas com status (ERRO)
SELECT product_name, COUNT(*) AS total_sales FROM testkeyspace.sales WHERE sale_date >= '2023-10-01' AND sale_date <= '2023-10-31' AND status = 'completed' GROUP BY customer_id, product_name ALLOW FILTERING;
```

```sql
-- Consulta 2: Obter produtos vendidos em um intervalo de datas com status (CERTO)
SELECT product_name, COUNT(*) AS total_sales FROM testkeyspace.sales_by_product_name_view WHERE sale_date >= '2023-10-01' AND sale_date <= '2023-10-31' AND status = 'completed' GROUP BY product_name ALLOW FILTERING;
```


```sql
-- MOSTRAR A QUANTIDAD DE REGISTROS:
SELECT COUNT(*) FROM testkeyspace.customers;
```

```sql
-- CRIANDO Novo registro com UPDATE no Cassandra:
UPDATE testkeyspace.customers SET name = 'John Doe', email = 'john.doe@example.com', address = '123 Main St' WHERE customer_id = uuid();
```

```sql
SELECT * FROM testkeyspace.customers WHERE name = 'John Doe' ALLOW FILTERING;
```

### Curiosidade ->

> O Cassandra não lê os dados no momento da escrita, o que é exatamente o que os outros dados fazem, Por tanto o Cassandra é mais performático.

---

## MYSQL ->

```bash
cat ./scripts/mysql-setup.sql | docker exec -i mysql-db mysql -uroot -prootpassword testdb
```

- Entrar no MYSQL ->

```bash
docker exec -it mysql-db mysql -uroot -prootpassword testdatabase
```

### MySQL's Queries ->

```sql
-- Consulta 1: Obter total de vendas por cliente
SELECT customer_id, SUM(quantity) AS total_quantity, SUM(price * quantity) AS total_sales FROM sales WHERE sale_date >= '2023-10-01' AND sale_date <= '2023-10-31' GROUP BY customer_id;
```

```sql
-- Consulta 2: Obter produtos vendidos em um intervalo de datas com status
SELECT product_name, COUNT(*) AS total_sales FROM sales WHERE sale_date >= '2023-10-01' AND sale_date <= '2023-10-31' AND status = 'completed' GROUP BY product_name;
```
