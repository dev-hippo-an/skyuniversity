<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.4/css/dx.common.css" />
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.4/css/dx.light.css" />


<style type="text/css">

#scContainer {
	width: 80%;
}

th, td {
	width: 150px;
	height: 50px;
}

div#scWrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
}

</style>

<script src="https://cdn3.devexpress.com/jslib/20.2.4/js/dx.all.js"></script>
<script type="text/javascript" src="https://unpkg.com/frozor-hybrid@2.0.4/index.js"></script>
<script type="text/javascript">

var data = ${ssList};

/* var data = [
    {
        text: "Google AdWords Strategy",
        roomId: 1,
        startDate: new Date("2021-04-30T16:00:00.000Z"),
        endDate: new Date("2021-04-30T17:30:00.000Z")
    }, {
        text: "New Brochures",
        roomId: 5,
        startDate: new Date("2021-04-30T18:30:00.000Z"),
        endDate: new Date("2021-04-30T21:15:00.000Z")
    }, {
        text: "Brochure Design Review",
        roomId: 5,
        startDate: new Date("2021-04-30T20:15:00.000Z"),
        endDate: new Date("2021-04-30T23:15:00.000Z")
    }, {
        text: "Website Re-Design Plan",
        roomId: 5,
        startDate: new Date("2021-04-30T23:45:00.000Z"),
        endDate: new Date("2021-04-30T18:15:00.000Z")
    }, {
        text: "Rollout of New Website and Marketing Brochures",
        roomId: 2,
        startDate: new Date("2021-05-04T15:15:00.000Z"),
        endDate: new Date("2021-05-04T17:45:00.000Z")
    }, {
        text: "Update Sales Strategy Documents",
        roomId: 3,
        startDate: new Date("2021-05-04T19:00:00.000Z"),
        endDate: new Date("2021-05-04T20:45:00.000Z")
    }, {
        text: "Non-Compete Agreements",
        roomId: 3,
        startDate: new Date("2021-05-04T15:15:00.000Z"),
        endDate: new Date("2021-05-04T16:00:00.000Z")
    }, {
        text: "Update NDA Agreement",
        roomId: 1,
        startDate: new Date("2021-05-05T18:45:00.000Z"),
        endDate: new Date("2021-05-05T20:45:00.000Z")
    }, {
        text: "Update Employee Files with New NDA",
        roomId: 4,
        startDate: new Date("2021-05-13T21:00:00.000Z"),
        endDate: new Date("2021-05-13T23:45:00.000Z")
    }, {
        text: "Submit Questions Regarding New NDA",
        roomId: 4,
        startDate: new Date("2021-05-13T15:00:00.000Z"),
        endDate: new Date("2021-05-13T16:30:00.000Z")
    }, {
        text: "Submit Signed NDA",
        roomId: 4,
        startDate: new Date("2021-05-13T19:45:00.000Z"),
        endDate: new Date("2021-05-13T21:00:00.000Z")
    }, {
        text: "Review Revenue Projections",
        roomId: 4,
        startDate: new Date("2021-05-21T00:15:00.000Z"),
        endDate: new Date("2021-05-21T01:00:00.000Z")
    }, {
        text: "Comment on Revenue Projections",
        roomId: 1,
        startDate: new Date("2021-05-17T16:15:00.000Z"),
        endDate: new Date("2021-05-17T18:15:00.000Z")
    }, {
        text: "Provide New Health Insurance Docs",
        roomId: 4,
        startDate: new Date("2021-05-17T19:45:00.000Z"),
        endDate: new Date("2021-05-17T21:15:00.000Z")
    }, {
        text: "Review Changes to Health Insurance Coverage",
        roomId: 4,
        startDate: new Date("2021-05-20T21:15:00.000Z"),
        endDate: new Date("2021-05-20T22:30:00.000Z")
    }, {
        text: "Review Training Course for any Ommissions",
        roomId: 4,
        startDate: new Date("2021-05-17T21:00:00.000Z"),
        endDate: new Date("2021-05-17T19:00:00.000Z")
    }, {
        text: "Recall Rebate Form",
        roomId: 2,
        startDate: new Date("2021-05-18T19:45:00.000Z"),
        endDate: new Date("2021-05-18T20:15:00.000Z")
    }, {
        text: "Create Report on Customer Feedback",
        roomId: 3,
        startDate: new Date("2021-05-18T22:15:00.000Z"),
        endDate: new Date("2021-05-19T00:30:00.000Z")
    }, {
        text: "Review Customer Feedback Report",
        roomId: 3,
        startDate: new Date("2021-05-12T23:15:00.000Z"),
        endDate: new Date("2021-05-13T01:30:00.000Z")
    }, {
        text: "Customer Feedback Report Analysis",
        roomId: 3,
        startDate: new Date("2021-05-12T16:30:00.000Z"),
        endDate: new Date("2021-05-12T17:30:00.000Z")
    }, {
        text: "Prepare Shipping Cost Analysis Report",
        roomId: 3,
        startDate: new Date("2021-05-18T19:30:00.000Z"),
        endDate: new Date("2021-05-18T20:30:00.000Z")
    }, {
        text: "Provide Feedback on Shippers",
        roomId: 3,
        startDate: new Date("2021-05-18T21:15:00.000Z"),
        endDate: new Date("2021-05-18T23:00:00.000Z")
    }, {
        text: "Select Preferred Shipper",
        roomId: 1,
        startDate: new Date("2021-05-22T00:30:00.000Z"),
        endDate: new Date("2021-05-22T03:00:00.000Z")
    }, {
        text: "Complete Shipper Selection Form",
        roomId: 5,
        startDate: new Date("2021-05-20T15:30:00.000Z"),
        endDate: new Date("2021-05-20T17:00:00.000Z")
    }, {
        text: "Upgrade Server Hardware",
        roomId: 5,
        startDate: new Date("2021-05-21T19:00:00.000Z"),
        endDate: new Date("2021-05-21T21:15:00.000Z")
    }, {
        text: "데이터베이스 모델링",
      	sort: 1,
        startDate: new Date("2020-12-21T00:45:00.000Z"),
        endDate: new Date("2020-12-23T24:00:00.000Z")
    }
]; */

var resourcesData = [
    {
        text: "학교일정",
        id: 0,
        color: "#03bb92"
    }, {
        text: "학과일정",
        id: 1,
        color: "#f34c8a"
    }
];

$(function(){
    var scheduler = $("#scheduler").dxScheduler({
        /* timeZone: "America/Los_Angeles", */
        timeZone: "Europe/London",
        dataSource: data,
        views: [{
            type: "month",
            name: "Auto Mode",
            maxAppointmentsPerCell: "auto"
        }, {
            type: "month",
            name: "Unlimited Mode",
            maxAppointmentsPerCell: "unlimited"
        }, {
            type: "month",
            name: "Numeric Mode",
            maxAppointmentsPerCell: 2
        }],
        currentView: "Auto Mode",
        currentDate: new Date(2020, 12, 01),
        resources: [{
            fieldExpr: "sort",
            dataSource: resourcesData,
            label: "일정구분"
        }],
        height: 650
    }).dxScheduler("instance");
});
</script>

<div id="scWrapper">
    <div class="dx-viewport demo-container" id="scContainer">
        <div id="scheduler"></div>
    </div>
	<div style="width: 80%;">
		<h2>일정상세</h2>
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>일자</th>
					<th>구분</th>
					<th>일정명</th>
					<th>일정내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="slist" items="${sScheduleList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${slist.startDate}</td>
						<td>${slist.status}</td>
						<td>${slist.subject}</td>
						<td>${slist.contents}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</html>