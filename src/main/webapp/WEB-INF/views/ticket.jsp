<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="calendar" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<c:forEach items="${ticketDTO}" var="call">
    <div class="ticket">
        <div class="image" style="background-image: url(resources/images/${call.img}.jpg); background-size: cover;">
            <div class="image-logo">
                <div class="icon">
                    <svg version="1.1" width="40px" height="40px" viewBox="0 0 486.208 486.208"
                         transform="translate(0, -5)">
                        <g>
                            <path d="M478.996,219.227l-186.039-54l33.976-41.794h20.909c-1.057,4.382,0.97,9.078,5.155,11.229                          c1.464,0.751,3.023,1.107,4.562,1.107c3.629,0,7.131-1.982,8.902-5.433L367.66,128c3.096-6.024,3.14-12.313,0.122-17.254
                         c-2.839-4.648-7.896-7.314-13.881-7.314h-70.334c-9.332,0-19.438,6.49-24.031,15.432c-2.521,4.913-0.586,10.941,4.327,13.464
                         c4.912,2.523,10.94,0.585,13.464-4.327c1.249-2.433,4.773-4.568,6.24-4.568h17.59l-29.163,35.874
                         c-10.458-2.757-20.439-5.074-28.518-6.897c-3.374-0.762-13.447-2.201-27.428-2.201c-22.11,0-55.843,3.574-90.966,20.605
                         c-47.539,23.053-81.532,72.511-93.938,92.705l-1.235,2.008c-9.854,16.021-20.043,32.589-26.492,51.212
                         c-9.362,27.034,0.787,49.428,27.151,59.903c10.391,4.127,22.286,6.133,36.365,6.133c0.886,0,1.769-0.008,2.65-0.022
                         c25.103-0.407,45.408-1.243,63.906-2.631c24.284-1.819,45.493-5.592,64.835-11.528c63.577-19.513,123.852-40.978,196.038-67.013
                         c18.592-6.705,37.459-13.596,55.704-20.259c8.702-3.178,26.347-9.606,26.466-9.646c8.448-2.771,9.691-9.125,9.67-12.71
                         l0.005-30.134C486.209,224.381,483.269,220.467,478.996,219.227z
                         M466.204,254.143c-7.666,2.794-15.331,5.593-22.996,8.394
                         c-18.228,6.655-37.073,13.539-55.629,20.229c-71.93,25.942-131.972,47.325-195.121,66.707
                         c-17.901,5.495-37.681,8.997-60.462,10.704c-9.59,0.719-19.705,1.285-30.762,1.721c13.622-16.564,17.65-30.611,12.3-42.622
                         c-6.312-14.161-24.358-22.08-55.173-24.212c-8.126-0.562-15.976-0.628-22.547-0.501l9.587-15.297l12.016,2.114
                         c0.012,0.002,30.817,5.72,56.973,0.023c17.027-3.708,29.321-15.854,36.742-22.787c0.555-0.518,59.173-54.847,58.674-68.417
                         c-0.146-3.929-1.743-7.445-4.665-9.894c-3.492-2.928-9.56-5.814-26.588-6.409c14.399-2.848,27.31-3.688,37.497-3.688
                         c12.823,0,21.424,1.349,23.023,1.71c10.567,2.386,24.461,5.632,38.183,9.577l165.853,48.14l-189.004-4.362
                         c-0.06-0.004-0.116-0.006-0.174-0.006c-43.828,0-79.896,50.9-81.411,53.066c-0.571,0.819-0.603,1.899-0.076,2.748
                         c0.46,0.744,1.269,1.186,2.125,1.186c0.122,0,0.245-0.01,0.369-0.027l291.27-37.103L466.204,254.143z"
                                  fill="#ff9308"></path>
                        </g>
                    </svg>
                </div>
                <div class="firm">
                    Ferrovia
                </div>
            </div>
        </div>
        <div class="info">
            <div class="sity from">
                    ${call.from}
            </div>
            <div class="train">
                <svg viewBox="0 0 512 512" height="30px" width="30px">
                    <path d="M0 376.163h512v15.673H0zM0 186.943h16.696v15.673H0zM472.62 277.884l-64.52-64.52c-17.037-17.036-39.688-26.418-63.782-26.418H33.39v15.674H259.71c3.93 37.475 35.707 66.783 74.206 66.783h108.058l19.566 19.566c5.956 5.954 9.236 13.868 9.236 22.284 0 8.415-3.28 16.33-9.237 22.284-5.955 5.956-13.87 9.236-22.284 9.236h-327.95v15.673H439.25c12.602 0 24.452-4.91 33.37-13.826 8.916-8.915 13.825-20.765 13.825-33.367 0-12.602-4.91-24.453-13.826-33.37zm-138.707-24.156c-29.846 0-54.583-22.297-58.428-51.11h68.833c19.907 0 38.623 7.753 52.7 21.83l29.28 29.28h-92.385z"></path>
                    <path d="M170.25 220.338v49.065h71.326v-49.065H170.25zm55.652 33.39h-39.98V236.01h39.98v17.718zM81.207 220.338v49.065h71.326v-49.065H81.207zm55.653 33.39H96.88V236.01h39.98v17.718zM0 220.338v15.673h47.816v17.718H0v15.674h63.49v-49.064zM33.39 342.768h55.652v15.674h-55.65zM0 342.768h16.696v15.674H0zM66.783 309.384h100.174v15.673H66.783zM33.39 309.384h16.697v15.673H33.39zM189.22 153.558h100.175v15.673H189.22zM155.826 153.558h16.695v15.673h-16.694zM133.57 120.163h66.782v15.673H133.57zM100.174 120.163h16.696v15.673h-16.696zM355.725 287.117H371.4v15.673h-15.675zM324.378 287.117h15.673v15.673H324.38zM418.42 287.117h15.672v15.673H418.42zM387.072 287.117h15.673v15.673h-15.673z"></path>
                </svg>
            </div>
            <div class="sity to">
                    ${call.to}
            </div>

            <div class="key_ticket">
                Имя: <br>
                Фамилия: <br>
                Вагон: <br>
                Масто: <br>
                Направление:<br>
                Отправление:<br>
                Прибытие:<br>
                &#8470; билета: <br>
            </div>
            <div class="value">
                <div class="name_ticket first_ticket">
                        ${user.first_name} <br>
                </div>
                <div class="name_ticket last_ticket">
                        ${user.last_name} <br>
                </div>
                <div class="car_ticket">
                        ${call.car} <br>
                </div>
                <div class="sit_ticket">
                        ${call.sit} <br>
                </div>
                <div class="dir_ticket">
                        ${call.denotation} <br>
                </div>
                <div class="dep_time_ticket">
                    <calendar:formatDate value="${call.date_dep}" pattern="dd.MM.yyyy HH:mm"/> <br>
                </div>
                <div class="arr_time_ticket">
                    <calendar:formatDate value="${call.date_arr}" pattern="dd.MM.yyyy HH:mm"/> <br>
                </div>
                <div class="num_ticket">
                        ${call.car}_${call.sit}_1234 <br>
                </div>
            </div>
            <div class="code">
                <div class="qr">
                </div>
                <div class="info-logo">
                    <div class="price">
                        Цена:
                    </div>
                    <div class="value-price">
                        3850р
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>