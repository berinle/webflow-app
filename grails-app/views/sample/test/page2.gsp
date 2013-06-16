<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main' />
    <title>page 2</title>
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
</head>
<body>

<script type="text/javascript">
    $(document).ready(function() {

        Stripe.setPublishableKey("${grailsApplication.config.stripe.publishableKey}");

        $('#finish-btn').click(function(event) {
            event.preventDefault();

            Stripe.card.createToken({
                number: "4242424242424242",
                cvc: "123",
                exp_month: "10",
                exp_year: "20"
            }, stripeResponseHandler);

        });

        var stripeResponseHandler = function(status, response) {
            var $form = $('#myForm');

            if (response.error) {
               console.log("errors: " + response.error.message);
            } else {
                // token contains id, last4, and card type
                var token = response.id;
                console.log(token);
                // Insert the token into the form so it gets submitted to the server
                $form.append($('<input type="hidden" name="stripeToken" />').val(token));

                //add the event_id of the finish-btn for webflow to continue
                var $finish_btn = $("#finish-btn");
                $form.append($('<input type="hidden" name="' + $finish_btn.attr('name') +  '" value="' + $finish_btn.val() + '" />'));

                // and submit
                $form.submit();
            }
        };

    });

</script>

<g:form name="myForm">
    <h1>page 2</h1>
    <g:submitButton name="next" value="Finish" id="finish-btn"/>
    <g:submitButton name="cancel" value="Cancel"/>
</g:form>

</body>
</html>