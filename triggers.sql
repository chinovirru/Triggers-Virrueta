## Este trigger se utiliza para actualizar el stock de un producto cuando se realiza una venta
CREATE DEFINER = CURRENT_USER TRIGGER `db_pdl_prod`.`sales_detail_AFTER_INSERT` AFTER INSERT ON `sales_detail` FOR EACH ROW
BEGIN
	UPDATE products SET products.stock_current = (products.stock_current - NEW.quantity) WHERE NEW.product_id = products.product_id;
END

## Este trigger se utiliza para registrar en la tabla log cuando se realiza un pago.
CREATE DEFINER = CURRENT_USER TRIGGER `db_pdl_prod`.`payments_AFTER_INSERT` AFTER INSERT ON `payments` FOR EACH ROW
BEGIN
	INSERT INTO logs(`table`,`action`,`values`,`date`,`user_id`) VALUES ('payments','INSERT', concat(NEW.payment_id,NEW.amount,NEW.reference,NEW.type,NEW.sale_id), NOW(), NEW.user_id);
END
