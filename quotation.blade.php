<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <style>
        .quote_wrapper{
            border: solid 3px lightslategray;
            padding: 10px;
            margin: 15px;
        }

        .quote_wrapper_inner{
            border: solid 3px #ffe5e5;
            padding: 10px;
        }

        .quote_header{
            margin-bottom: 20px;
        }

        .quote_header_top{
            width: 100%;
        }

        .quote_header_top_left{
            width: 50%;
            float: left;
        }

        .quote_header_top_right{
            width: 50%;
            float: right;
        }

        .quote_header_bottom{
            width: 100%;
        }

        .quote_header_bottom_left{
            float: left;
            width: 50%;
        }

        .quote_header_bottom_right{
            float: right;
            width: 50%;
        }

        .quote_items{
            width: 100%;
            margin-top: 20px;
        }
        table{
            width: 100%;
        }
        tr{
            width: 100%;
        }
        td{
            width: 50%;
            padding-top: 0px;
        }
    </style>

</head>
<body>
<?php
extract($quotation_details_id);$inv_id = $id;
?>
<div class="quote_wrapper">
    <div class="quote_wrapper_inner">
        <div class="quote_header">
            <table>
                <tr>
                    <td>
                        <h3>PL Hardware</h3>
                        <span>
                            <i>We help you build</i>
                        </span>
                        <p>Location: PL House, Luzira</p></br>
                        <p>P.O. BOX: 10255 Kampala, Uganda</p></br>
                        <p>Mob: +256754487580</p></br>
                        <p>Tel: +256773327755</p></br>
                        <p>Email: info@plhardware.co.ug</p></br>
                        <p>Website: http://www.plhardware.co.ug</p>
                    </td>
                    <td>
                        <h2>Quotation</h2><br/>
                        Date: {{$created_at}}<br/>
                        Quotation #: {{$id}}<br/>
                        Customer Name: {{$clientid}}<br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>Quotation For:</h3>
                        Name:{{$clientid}}<br/>
                        Company:{{$clientid}}<br/>
                        Address:<br/>
                        City, State, Zip:<br/>
                        Phone:<br/>
                    </td>
                    <td>
                        <h3>Quotation Valid until: {{$created_at}}</h3></br>
                        Prepared by: {{ Session::get('username') }}
                    </td>
                </tr>
            </table>
        </div>
        <div class="quote_items">
            <?php
            $users_arr = $details;
            if (is_array($users_arr) && count($users_arr)) {
                $users = '<table border="1" style="border-collapse: collapse;">
            <thead>
                <tr style="background-color: #337ab7">
                    <th>#</th>
                    <th>Product Code</th>
                    <th>Unit</th>
                    <th>Quantity</th>
                    <th>Rate</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>';
                //print_r($quotation_details_id);exit;

                $i = 1;
                $total = 0;
                foreach ($users_arr as $pos => $info) {
                    extract($info);
                    $amount = ($rate * $quantity);
                    $total += $amount;
                    $users .= "<tr>
                    <td style='text-align: center'>$i</td>
                    <td style='text-align: center'>$pdt_code</td>
                    <td style='text-align: center'>$unit_of_measure</td>
                    <td style='text-align: center'>$quantity</td>
                    <td style='text-align: center'>$rate</td>
                    <td style='text-align: center'>".number_format($amount)."</td>
                </tr>";

                    $i++;
                }
                $users .= "<tr><th colspan='5' style='text-align:right;' >TOTAL</th><th>".number_format($total)."</th></tr>";
                $users .="</tbody></table>";
                echo $users;
            }
            ?>
        </div>
    </div>
</div>
</body>