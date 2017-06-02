class Economics {
  constructor(course_id, dept) {
    this.course_id = course_id;
    this.dept = dept;
  }

  course_div() {
    console.log(`This course is part of the ${this.dept} department`)
  }
}

module.exports = Economics;