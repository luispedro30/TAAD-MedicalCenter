Number.prototype.pad = function(size) {
    var s = String(this);
    while (s.length < (size || 2)) {s = "0" + s;}
    return s;
}

let insertArray = [];

let arrayStaff = [1,2,3,4,5];

let frequencyOfCanceled = [3, 7];

let canceledNumberTicket;
let canceledReasons = ['Demorou a ser atendido', 'Não pode esperar mais', 'Sentiu-se melhor'];

let hoursArray = [08, 18];
let minutesArray = [00, 59];
let secondsArray = [00, 59];
let workingStaff;

let dateTimeString = "2022-01-[#DAY#] [#HOUR#]:[#MINUTES#]:[#SECONDS#]:737";
let pacient_id = 0;

let countRows = 1;
let text = "";

for(let days = 1; days <= 31; days++){
    let numberTicketsDay = RandomNumber(20,70);
    if(days == 1){
        workingStaff = RandomSorted(arrayStaff, 2);
    }

    if(days%5===0 && insertArray.length != 0){
        let lastArrayObjects = [...insertArray].reverse();
        let count = 0;
        let array = [];
        for(let obj of lastArrayObjects){
            if(array.length== 0 || (!array.includes(obj.reception_id) && count<2)){
                array.push(obj.reception_id);
                count++;
            }
        }
        let workersNotInLast5Days = [...arrayStaff].filter(x => !array.includes(x));
        workingStaff = RandomSorted(workersNotInLast5Days, 2);
    }
    let numberOfCanceledTicketsDay = RandomNumber(frequencyOfCanceled[0], frequencyOfCanceled[1]);
    let canceledNumberTicket = RandomCanceledTickets(numberOfCanceledTicketsDay, numberTicketsDay);
    for(let i = 1; i<=numberTicketsDay+1; i++){
        
        let ticket = {};
        ticket.id = i;
        let arrived_dateString = dateTimeString;
        let leave_dateString = dateTimeString;
        let call_dateString = dateTimeString;
        let Arrived = {};
        if(i==1){
            Arrived.hoursArrived = 08;
            Arrived.minutesArrived = RandomNumber(0,7);
            Arrived.secondsArrived = RandomNumber(0, 59);
            arrived_dateString = arrived_dateString.replace("[#DAY#]", days.pad()).replace("[#HOUR#]",Arrived.hoursArrived.pad()).replace("[#MINUTES#]", Arrived.minutesArrived.pad()).replace("[#SECONDS#]", Arrived.secondsArrived.pad());
        }else{
            let minutesRandom = RandomNumber(0,25);
            let secondsRandom = RandomNumber(0,59);
            Arrived = constructDateTime(insertArray[insertArray.length-1], minutesRandom, secondsRandom);
            arrived_dateString = arrived_dateString.replace("[#DAY#]", days.pad()).replace("[#HOUR#]",Arrived.hoursArrived.pad()).replace("[#MINUTES#]", Arrived.minutesArrived.pad()).replace("[#SECONDS#]", Arrived.secondsArrived.pad());
        
        }        
        
        ticket.id = i;
        ticket.arrived_date = arrived_dateString;
        ticket.arrived_date_class = Arrived;
        let Leave = {};
        let Call = {};
        if(canceledNumberTicket.includes(i)){
            call_dateString = "NULL";
            ticket.canceled = 1;
            let cancelled_reason = RandomSorted(canceledReasons, 1);
            ticket.cancelled_reason = cancelled_reason[0];

            let minutesRandom = RandomNumber(10,35);
            let secondsRandom = RandomNumber(0,59);
            Leave = constructDateTime(ticket, minutesRandom, secondsRandom);
            leave_dateString = leave_dateString.replace("[#DAY#]", days.pad()).replace("[#HOUR#]",Leave.hoursArrived.pad()).replace("[#MINUTES#]", Leave.minutesArrived.pad()).replace("[#SECONDS#]", Leave.secondsArrived.pad());
        }else{
            ticket.canceled = 0;
            ticket.cancelled_reason = "";
            let minutesRandom = RandomNumber(0,10);
            let secondsRandom = RandomNumber(0,59);
            leave_dateString = "NULL";
            Call = constructDateTime(ticket, minutesRandom, secondsRandom);
            call_dateString = call_dateString.replace("[#DAY#]", days.pad()).replace("[#HOUR#]",Call.hoursArrived.pad()).replace("[#MINUTES#]", Call.minutesArrived.pad()).replace("[#SECONDS#]", Call.secondsArrived.pad());
        }

        ticket.call_date = call_dateString;
        ticket.leave_date = leave_dateString;
        let reception_id = RandomSorted(workingStaff, 1)
        ticket.reception_id = reception_id[0];
        
        ticket.pacient_id = RandomNumber(0, 300);
        let insertString = `INSERT INTO medical_center.medical_center.ticket (id, number, arrived_date, call_date, cancelled, cancelled_reason, leave_date, reception_id, patient_id) VALUES ('${countRows}', '${ticket.id}', '${ticket.arrived_date}', '${ticket.call_date}', '${ticket.canceled}', '${ticket.cancelled_reason}', '${ticket.leave_date}', '${ticket.reception_id}', '${ticket.pacient_id}');`
        insertArray.push(ticket);
        text+=insertString +"\n";
        countRows++;
    }
}

console.log(text);

function RandomSorted(array, num){
    let shuffled = [...array].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, num);
}

function RandomNumber(min, max){
    return Math.floor(Math.random() * (max - min) + min)
}

function dateSum(lastElement, numSum){
    return lastElement - numSum-1;
}

function RandomCanceledTickets(numberOfCanceledTicketsDay, numberTicketsDay){
    let arrayWithCanceledTicketsNumber = [];
    for(let i = 0; i< numberOfCanceledTicketsDay; i++){
        arrayWithCanceledTicketsNumber.push(RandomNumber(1, numberTicketsDay));
    }
    return arrayWithCanceledTicketsNumber;
}

function constructDateTime(previousTicketTime, minutes, seconds){
    let arrived = {};
    let addMinute = false;
    let addHour = false;
    countSeconds = previousTicketTime.arrived_date_class.secondsArrived + seconds;

    if(countSeconds > secondsArray[1]){
        let diffCountSecs = countSeconds - secondsArray[1];
        arrived.secondsArrived = secondsArray[0]+diffCountSecs;
        addMinute = true;
    }else{
        arrived.secondsArrived = countSeconds;
    }
    let addM = 0;
     if(addMinute){
        addM = 1;
    }
    countMinutes = previousTicketTime.arrived_date_class.minutesArrived + minutes + addM;
    if(countMinutes > minutesArray[1]){
        let diffCountMins = countMinutes -minutesArray[1];
        arrived.minutesArrived = minutesArray[0]+diffCountMins;
        addHour = true;
    }else{
        arrived.minutesArrived = countMinutes;
    }
    let addH = 0;
    if(addHour){
        addH = 1;
    }
    arrived.hoursArrived = previousTicketTime.arrived_date_class.hoursArrived + addH;

    return arrived;
} 

