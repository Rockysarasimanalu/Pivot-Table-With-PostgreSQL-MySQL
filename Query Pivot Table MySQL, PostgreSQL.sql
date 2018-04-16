with w as (
						select 
						 o.ordernumber AS no_order,	 
						 o.completed AS tanggal,
						 aic.communityname AS nama_salesman,
						 mcd.mpmcustomerid AS kode_toko,
						 mcd.mpmcustomername AS nama_toko,
						 p.lotteproductcode AS kode_produk,
						 p.name AS nama_produk,
						 null::text AS TOP,   
						 oi.quantity AS qty_jual,
						 null::text as Qty_bonus, 
							 case 
								 when oi.taxtype = 0 THEN round(oi.unitprice * 1.1) 
								 when oi.taxtype = 1 THEN round(oi.unitprice + ((oi.unitprice-oi.pricefromdealerbeforetaxed)*0.1)) 
								 else 0 
							 end as harga_unit, 
							 case 
								 when oi.taxtype = 0 THEN round((oi.unitprice * 1.1)*(oi.quantity)) 
								 when oi.taxtype = 1 THEN round((oi.unitprice + ((oi.unitprice-oi.pricefromdealerbeforetaxed)*0.1))*(oi.quantity)) 
								 else 0 
							 end as totalrph  
						 from TableG o 
						
						 join TableF oi on o.orderid=oi.orderid
						 join TableE p on oi.productid=p.productid 
						 join TableC wu on o.warunguserid=wu.warunguserid 
						 join TableD w on w.warungid = wu.warungid 
						 join TableA aic on aic.agentinvitationcodeid=w.agentinvitationcodeid 
						 left join TableH mcdu ON mcdu.userid = wu.userid 
						 left join TableB mcd ON mcd.mpmcustomerdataid = mcdu.mpmcustomerdataid
						 where o.timestamporderpaid BETWEEN '2018-04-03 12:00:000' AND '2018-04-03 21:25:000' and o.vendorid in (select vendorid from sscvendor WHERE lower(name) LIKE '%diy%' and isactiveforwarung)  AND aic.invitationcode like '%MPM%' 
				-- 		 where o.timestamporderpaid >= TO_CHAR(now() - interval '9 hours 25 minutes' , 'YYYY-MM-DD HH24:MI:SS') and o.vendorid in (select vendorid from sscvendor WHERE lower(name) LIKE '%diy%' and isactiveforwarung)  AND aic.invitationcode like '%MPM%' 
						
				 ) 

				 select 
    				 case when LAG(no_order) OVER() = no_order THEN '' ELSE CONCAT(no_order) END AS no_order,
                     case when LAG(tanggal) OVER() = tanggal THEN '' ELSE tanggal END AS tanggal,
                     case when LAG(nama_salesman) OVER() = nama_salesman THEN '' ELSE nama_salesman END AS nama_salesman,
                     case when LAG(kode_toko) OVER() = kode_toko THEN '' ELSE kode_toko END AS kode_toko,
                     case when LAG(nama_toko) OVER() = nama_toko THEN '' ELSE nama_toko END AS nama_toko,kode_produk,nama_produk,TOP,qty_jual,Qty_bonus,harga_unit,totalrph FROM (
                        SELECT * FROM (
				            select 1,no_order,tanggal,nama_salesman,kode_toko,nama_toko,kode_produk,nama_produk,CONCAT(TOP) AS TOP,CONCAT(qty_jual) AS qty_jual,CONCAT(Qty_bonus) AS Qty_bonus,CONCAT(harga_unit) AS harga_unit,totalrph FROM w 
				            union 
				            select 2,no_order,'','', '','','', '','','','','',totalrph FROM (
				                SELECT no_order, SUM(totalrph) as totalrph FROM w GROUP BY 1) x
			            ) a ORDER BY 2,1
                     ) a
				  