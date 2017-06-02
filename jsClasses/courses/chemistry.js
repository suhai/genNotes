class Chemistry {
  constructor(course_id, proff) {
    this.course_id = course_id;
    this.prof = proff;
  }

  prof_name() {
    console.log(`This is taught by professor ${this.prof}`)
  }
}

module.exports = Chemistry;