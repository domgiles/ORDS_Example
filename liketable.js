// Author : Dominic Giles
// Date : 21/7/2016
// File : liketable.js
// Description : Javascript to enable rows to be liked in a given table
//               Note : DataTable paging is excluded for brevity
// Javascript Libraries : JQuery, JQuery UI, BootStrap, DataTable

$(document).ready(function () {

    var $userName = 'dominic.giles';
    var $tableName = 'product_information';
    var $hostport = 'http://oracle12c2:8080';
    var $uniqueIDColumn = "product_id";

    $('#products').DataTable({
        "ajax": {
            "url": $hostport + "/ords/soe/info/products",
            "dataSrc": "items"
        },
        "columns": [
            {"data": "product_id"},
            {"data": "product_name"},
            {"data": "product_description"},
            {"data": "category_id"},
            {"data": "product_status"},
            {"data": "list_price"},
            {"data": "catalog_url"}
        ],
        "columnDefs": [{
            "targets": 6,
            "render": function (data, type, full, meta) {
                return '<i class="icon-thumbs-up"></i> 0';
            }
        }],
        "searching": false,
        "ordering": false,
        "lengthChange": false,
        "createdRow": function (row, data, index) {
            var like = getRowLikes($userName, $tableName, data[$uniqueIDColumn]);
            like.done(function (l) {

                $('td', row).eq(6).html(getLikeHTML(data[$uniqueIDColumn], l.total_likes));

                if (l.user_likes == 1) {
                    $('#likeButton_' + data[$uniqueIDColumn]).addClass("icon-thumbs-up like");
                }

                $('#likeButton_' + data[$uniqueIDColumn]).click(function () {
                    console.log("Like button pressed for row with " + $uniqueIDColumn + " = " + data[$uniqueIDColumn]);
                    var checklike = getRowLikes($userName, $tableName, data[$uniqueIDColumn]);
                    checklike.done(function (cl) {
                        if (cl.user_likes == 0) {  // The current user hasn't already liked it
                            $('#likeButton_' + data[$uniqueIDColumn]).toggleClass("like");
                            likeRow($userName, $tableName, data[$uniqueIDColumn]);
                            var newlike = getRowLikes($userName, $tableName, data[$uniqueIDColumn]);
                            newlike.done(function (nl) {
                                $('#totalLikes_' + data[$uniqueIDColumn]).text(nl.total_likes);
                            });
                        } else {
                            $('#likeButton_' + data[$uniqueIDColumn]).toggleClass("like");
                            dislikeRow($userName, $tableName, data[$uniqueIDColumn]);
                            var newlike = getRowLikes($userName, $tableName, data[$uniqueIDColumn]);
                            newlike.done(function (nl) {
                                $('#totalLikes_' + data[$uniqueIDColumn]).text(nl.total_likes);
                            });
                        }
                    });
                });
            });
        }
    });

    function getLikeHTML(prodId, totLikes) {
        var htmlString = '<i id="likeButton_' + prodId + '" class="icon-thumbs-up"></i> '
            + '<span id="totalLikes_' + prodId + '"> ' + totLikes + ' </span>';
        return htmlString;
    }


    function likeRow(un, tn, rID) {
        $.ajax({
            url: $hostport + "/ords/soe/utilities/like",
            type: "POST",
            data: {"table_name": tn, "column_value": rID, "user_id": un},
            async: false
        });
    }

    function dislikeRow(un, tn, rID) {
        $.ajax({
            url: $hostport + "/ords/soe/utilities/unlike?table_name=" + tn + "&column_value=" + rID + "&user_id=" + un,
            type: "DELETE",
            async: false
        });
    }

    function getRowLikes(un, tn, rID) {
        var likeResult = $.ajax({
            url: $hostport + "/ords/soe/utilities/getlikes?table_name=" + tn + "&column_value=" + rID + "&user_id=" + un,
            type: "GET"
        });
        return likeResult;
    }
})
;