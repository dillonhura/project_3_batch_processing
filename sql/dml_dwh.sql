-- transform to dwh
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