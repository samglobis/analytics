with payments as (
    select * from {{ref('stg_payments')}}
),
pivoted as (
    select 
        order_id
        ,sum(case when payment_method = 'bank_transfer' then amount else 0 end) as bank_transfer 
        ,sum(case when payment_method = 'coupon' then amount else 0 end) as coupon 
        ,sum(case when payment_method = 'credit_card' then amount else 0 end) as credit_card 
        ,sum(case when payment_method = 'gift_card' then amount else 0 end) as gift_card 
    from payments
    where status = 'success'
    group by order_id
)
select * from pivoted
