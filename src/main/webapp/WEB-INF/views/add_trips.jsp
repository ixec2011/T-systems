<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="account_enter">
    <div class="account_title">ДОБАВИТЬ РЕЙС</div>
    <div class="sing-in">
        <form id="add-trip-form" action="/ferrovia/user/sing_up" method="post">
            <div class="form-header">
                Поезд:<br><select class="form-input" name="train">
                <c:forEach items="${trainList}" var="call">
                    <option class="station-select">${call}</option>
                </c:forEach>
            </select>
                Направление: <br> <select class="form-input" name="line">
                <c:forEach items="${lineList}" var="call">
                    <option class="station-select">${call}</option>
                </c:forEach>
            </select>
                <br>
                Время отправления:
                <br>
                <input type="text" class="form-input" name="date_dep" id="date_dep"/>
                <input type="time" class="form-input" name="time_dep" id="time_dep"/>
            </div>
            <input type="submit" class="form-submit" value="Добавить рейс">
        </form>
    </div>
</div>

<script>
    $("#add-trip-form").submit(function (e) {
        e.preventDefault();
        var form = $(this);
        $.ajax({
            url: 'trip/add',
            type: 'post',
            data: form.serialize(),
            success: function (response) {
                $('.content').html(response)
            }
        });
        form.trigger('reset');
    });

    $("#date_dep").datepicker({
        dateFormat: "yy-mm-dd",
        minDate: 0,
        maxDate: "+1M +15D"
    });
</script>