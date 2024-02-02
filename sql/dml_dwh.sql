-- transform to dwh
INSERT INTO dwh_project3.dim_orders (
	order_id,
	order_date,
	user_id,
	payment_name,
	shipper_name,
	order_price,
	order_discount,
	voucher_name,
	voucher_price,
	order_total,
	rating_status
)

SELECT
    o.order_id,
    o.order_date,
    o.user_id,
    p.payment_name,
    s.shipper_name,
    o.order_price,
    o.order_discount,
    v.voucher_name,
    v.voucher_price,
    o.order_total,
    r.rating_status
FROM
    tb_orders o
JOIN
    tb_payments p ON o.payment_id = p.payment_id
JOIN
    tb_shippers s ON o.shipper_id = s.shipper_id 
JOIN
    tb_vouchers v ON o.voucher_id = v.voucher_id
JOIN
    tb_ratings r ON o.rating_id = r.rating_id;