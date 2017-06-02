
const Course = require("./courses");

const chem101 = new Course.Chemistry(101, 'Arthur Glasfeld');
console.log(chem101);
chem101.prof_name();
console.log();

const econ202 = new Course.Economics(202, 'ECON');
console.log(econ202);
econ202.course_div();
console.log();

const phys303 = new Course.Physics(303, 417);
console.log(phys303);
phys303.summary;
console.log();