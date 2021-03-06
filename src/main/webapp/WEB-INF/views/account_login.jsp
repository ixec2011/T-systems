<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="account_enter">
    <div class="menu-login">
        <ul class="menu-login-ul">
            <li class="menu-login-li"><a class="menu-login-a" href="#sign-in" id="sign-in">Вход</a></li>
            <li class="menu-login-li"><a class="menu-login-a" href="#sign-up" id="sign-up">Регистрация</a></li>
        </ul>
    </div>
    <div class="sign-in">
        <form id="submit-in" action="user/sing_in" method="post">
            <div class="form-header">
                <input type="email" class="form-input" name="email_in" id="email_in"
                       placeholder="Электронная почта" required/><br>
                <input type="password" class="form-input" name="password_in" id="password_in"
                       placeholder="Пароль" required/>
            </div>
            <input type="submit" class="form-submit" value="Войти">
        </form>
    </div>
    <div class="sign-up">
        <form id="submit-up" action="user/sing_up" method="post">
            <div class="form-header">
                <input type="text" class="form-input" name="first_name_up" id="first_name_up" placeholder="Имя"
                       required/>
                <input type="text" class="form-input" name="last_name_up" id="last_name_up" placeholder="Фамилия"
                       required/>
                <input type="email" class="form-input" name="email_up" id="email_up"
                       placeholder="Электронная почта" required/>
                <input type="text" class="form-input" name="date_up" id="date_up"
                       placeholder="День Рождения" required/>
                <input type="password" class="form-input" name="password_up" id="password_up"
                       placeholder="Пароль" required/>
                <input type="password" class="form-input" name="repeat_password_up"
                       id="repeat_password_up" placeholder="Повторите пароль" required/>
            </div>
            <input type="submit" class="form-submit" value="Зарегистрироваться">
        </form>
    </div>
</div>
<script>
    $("#sign-up").click(function () {
        $(".sign-in").fadeOut(0);
        $(".sign-up").fadeIn(1000);
    });

    $("#sign-in").click(function () {
        $(".sign-up").fadeOut(0);
        $(".sign-in").fadeIn(1000);
    });

    $("#date_up").datepicker({
        dateFormat: "yy-mm-dd",
        maxDate: 0
    });

    $('#email_in, #password_in').unbind().blur(function () {
        var id = $(this).attr('id');
        var val = $(this).val();
        switch (id) {
            case 'password_in':
                if (val.length > 5) {
                    $(this).addClass('form-input--noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input--noterror').addClass('form-input--error');
                }
                break;
            case 'email_in':
                var rv_email = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
                if (val !== '' && rv_email.test(val)) {
                    $(this).addClass('form-input--noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input--noterror').addClass('form-input--error');
                }
                break;
        }
    });

    $('#submit-in').submit(function (e) {
        e.preventDefault();
        if ($('.form-input--noterror').length != 2) {
            return false;
        } else {
            $.ajax({
                    url: 'user/sing_in',
                    type: 'post',
                    data: $(this).serialize(),
                    success: function (response) {
                        if (response !== "") {
                            $('.account_page').html(response)
                                .removeClass('message--error')
                                .show("slide", {
                                    direction: "left"
                                }, 500);
                            var fn = $(".account_first_name").text();
                            var ln = $(".account_last_name").text();
                            $('.user_name').text(fn + " " + ln.charAt(0) + ".");
                            $(".resp_info").text("\u0412\u0445\u043E\u0434\u0020\u0443\u0441\u043F\u0435\u0448\u043D\u043E\u0020\u0432\u044B\u043F\u043E\u043B\u043D\u0435\u043D\u0021\n")
                                .fadeIn(1000);
                            setTimeout(function () {
                                $(".resp_info").fadeOut(1000);
                            }, 4000);

                        } else {
                            $(".resp_info").text("\u041F\u0440\u043E\u0432\u0435\u0440\u044C\u0442\u0435\u0020\u043F\u0440\u0430\u0432\u0438\u043B\u044C\u043D\u043E\u0441\u0442\u044C\u0021")
                                .fadeIn(1000);
                            setTimeout(function () {
                                $(".resp_info").fadeOut(1000);
                            }, 4000);
                        }

                    }
                }
            );
        }
    });

    $('#first_name_up,#last_name_up,#email_up,#password_up,#repeat_password_up').unbind().blur(function () {
        var id = $(this).attr('id');
        var val = $(this).val();
        switch (id) {
            case 'first_name_up':
                var rv_name = /^[a-zA-Zа-яА-Я]+$/;
                if (val.length > 2 && rv_name.test(val)) {
                    $(this).addClass('form-input-noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input-noterror').addClass('form-input--error');
                }
                break;
            case 'last_name_up':
                var rv_name = /^[a-zA-Zа-яА-Я]+$/;
                if (val.length > 2 && rv_name.test(val)) {
                    $(this).addClass('form-input-noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input-noterror').addClass('form-input--error');
                }
                break;
            case 'email_up':
                var rv_email = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
                var div = $(this);
                $.ajax({
                    url: 'user/check_email',
                    type: 'post',
                    data: {"email_up": val},
                    success: function (response) {
                        if (response === "yes") {
                            if (val !== '' && rv_email.test(val)) {
                                div.addClass('form-input-noterror').removeClass('form-input--error');
                            }
                            else {
                                div.removeClass('form-input-noterror').addClass('form-input--error');
                                $(".resp_info").text("\u041F\u043E\u0447\u0442\u0430\u0020\u0432\u0432\u0435\u0434\u0435\u043D\u0430\u0020\u043D\u0435\u043F\u0440\u0430\u0432\u0438\u043B\u044C\u043D\u043E\u0021")
                                    .fadeIn(1000);
                                setTimeout(function () {
                                    $(".resp_info").fadeOut(1000);
                                }, 4000);
                            }
                        } else {
                            div.removeClass('form-input-noterror').addClass('form-input--error');
                            $(".resp_info").text("\u041F\u043E\u0447\u0442\u0430\u0020\u0437\u0430\u043D\u044F\u0442\u0430\u0021")
                                .fadeIn(1000);
                            setTimeout(function () {
                                $(".resp_info").fadeOut(1000);
                            }, 4000);
                        }

                    }
                });
                break;
            case 'password_up':
                if (val.length > 5) {
                    $(this).addClass('form-input-noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input-noterror').addClass('form-input--error');
                }
                if (val == $('#repeat_password_up').val()) {
                    $('#repeat_password_up').addClass('form-input-noterror').removeClass('form-input--error');
                }
                else {
                    $('#repeat_password_up').removeClass('form-input-noterror').addClass('form-input--error');
                }
                break;
            case 'repeat_password_up':
                if (val == $('#password_up').val()) {
                    $(this).addClass('form-input-noterror').removeClass('form-input--error');
                }
                else {
                    $(this).removeClass('form-input-noterror').addClass('form-input--error');
                }
                break;
        }
    });

    $('#submit-up').submit(function (e) {
        e.preventDefault();
        if ($('.form-input-noterror').length != 5) {
            return false;
        } else {
            $.ajax({
                url: 'user/sing_up',
                type: 'post',
                data: $(this).serialize(),
                success: function (response) {
                    $('.account_page').html(response)
                        .removeClass('message--error')
                        .toggle("slide", {
                            direction: "left"
                        }, 500);
                    var fn = $(".account_first_name").text();
                    var ln = $(".account_last_name").text();
                    $('.user_name').text(fn + " " + ln.charAt(0) + ".");
                    $(".resp_info").text("\u0420\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u044F\u0020\u0443\u0441\u043F\u0435\u0448\u043D\u043E\u0020\u0437\u0430\u0432\u0435\u0440\u0448\u0435\u043D\u0430\u0021")
                        .fadeIn(1000);
                    setTimeout(function () {
                        $(".resp_info").fadeOut(1000);
                    }, 4000);
                }
            });
        }
    });
</script>
