
const randomId = function(length = 6) {
    return Math.random().toString(36).substring(2, length+2);
  };

const person = {
    id: randomId(),
    name: "John",
    email: "hafeefapc20023@gmail.com",
    collegeId: 123,
    Marks: [36, 40],
    subject: [{name: 'dsa', marks: 100}, {name: 'dbms', marks: 100}],
    Scholarship: false,
}
changestatus = () => {
    person.Scholarship = true;
    console.log("Scholarship status changed",person.Scholarship)
}
changedetails = () => {
    var name = prompt("Please enter your new name and new mail:");
    var email = prompt("Please enter your new email:");
    person.name = name;
    person.email = email;
    console.log("Name and email changed",person)
}
console.log(person);