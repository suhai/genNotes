class Physics {
  constructor(course_id, room_num) {
    this.course_id = course_id;
    this.room = room_num;
  }

  summary() {
    console.log(`This is offered in room ${this.room}`)
  }
}

module.exports = Physics;