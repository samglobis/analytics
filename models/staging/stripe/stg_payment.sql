with payment as (
    select ID as payment_id
     ,orderid as order_id
     ,paymentmethod as payment_method
     ,status as payment_status
     ,amount 
     from raw.stripe.payment
)
select * from payment