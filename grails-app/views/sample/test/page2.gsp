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

        var $myForm = $("#myForm");
        $('#finish-btn').click(function(event) {
            console.log("now preventing the form submission");
            event.preventDefault();

            $.getJSON("https://github.com/groovybayo.json", function(data){
                console.log("now submitting the form...");
                $myForm.submit();
            });

            return false;
        });

    });
</script>

<g:form name="myForm">
    <h1>page 2</h1>
    <g:submitButton name="next" value="Finish" id="finish-btn"/>
    <g:submitButton name="cancel" value="Cancel"/>
</g:form>

</body>
</html>