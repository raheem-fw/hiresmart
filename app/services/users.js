import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

export default class UsersService extends Service {
  @tracked employees = [
    {
      id: 1,
      name: 'John',
      email: 'j.d@gmail.com',
    },
  ];
  nextId = 1;

  addEmployee(data) {
    const employee = { id: this.nextId, ...data };
    this.employees.push(employee);
    this.nextId++;
  }

  updateEmployee(id, data) {
    let employee = this.employees.find((e) => e.id === id);
    Object.assign(employee, data);
  }

  deleteEmployee(id) {
    this.employees = this.employees.filter((e) => e.id !== id);
  }

  findAll() {
    return this.employees;
  }

  findById(id) {
    return this.employees.find((e) => e.id === id);
  }
}
