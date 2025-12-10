import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class UsersRoute extends Route {
  @service store;

  beforeModel() {
    if (this.store.peekAll('user').length === 0) {
      [
        {
          id: 1,
          firstName: 'John',
          lastName: 'Abram',
          email: 'john.abram@gm.com',
          dateOfJoining: '2025-01-01',
          team: 'Phoenix',
        },
        {
          id: 2,
          firstName: 'Dennis',
          lastName: 'Chaudhary',
          email: 'dennis.chaudhary@gm.com',
          dateOfJoining: '2025-01-05',
          team: 'Hydra',
        },
        {
          id: 3,
          firstName: 'Bala',
          lastName: 'Brown',
          email: 'bala.brown@freshworks.com',
          dateOfJoining: '2025-01-10',
          team: 'Orion',
        },
        // {
        //   id: 4,
        //   firstName: 'Sara',
        //   lastName: 'Miller',
        //   email: 'sara.miller@gm.com',
        //   dateOfJoining: '2025-01-15',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 5,
        //   firstName: 'Ankit',
        //   lastName: 'Sharma',
        //   email: 'ankit.sharma@freshworks.com',
        //   dateOfJoining: '2025-01-20',
        //   team: 'Phoenix',
        // },
        // {
        //   id: 6,
        //   firstName: 'Lina',
        //   lastName: 'Patel',
        //   email: 'lina.patel@gm.com',
        //   dateOfJoining: '2025-01-25',
        //   team: 'Hydra',
        // },
        // {
        //   id: 7,
        //   firstName: 'Raj',
        //   lastName: 'Verma',
        //   email: 'raj.verma@freshworks.com',
        //   dateOfJoining: '2025-01-30',
        //   team: 'Orion',
        // },
        // {
        //   id: 8,
        //   firstName: 'Maya',
        //   lastName: 'Singh',
        //   email: 'maya.singh@gm.com',
        //   dateOfJoining: '2025-02-04',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 9,
        //   firstName: 'Neil',
        //   lastName: 'Kapoor',
        //   email: 'neil.kapoor@freshworks.com',
        //   dateOfJoining: '2025-02-09',
        //   team: 'Phoenix',
        // },
        // {
        //   id: 10,
        //   firstName: 'Tina',
        //   lastName: 'Reddy',
        //   email: 'tina.reddy@gm.com',
        //   dateOfJoining: '2025-02-14',
        //   team: 'Hydra',
        // },
        // {
        //   id: 11,
        //   firstName: 'Vikram',
        //   lastName: 'Iyer',
        //   email: 'vikram.iyer@freshworks.com',
        //   dateOfJoining: '2025-02-19',
        //   team: 'Orion',
        // },
        // {
        //   id: 12,
        //   firstName: 'Priya',
        //   lastName: 'Desai',
        //   email: 'priya.desai@gm.com',
        //   dateOfJoining: '2025-02-24',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 13,
        //   firstName: 'Karan',
        //   lastName: 'Gupta',
        //   email: 'karan.gupta@freshworks.com',
        //   dateOfJoining: '2025-03-01',
        //   team: 'Phoenix',
        // },
        // {
        //   id: 14,
        //   firstName: 'Neha',
        //   lastName: 'Joshi',
        //   email: 'neha.joshi@gm.com',
        //   dateOfJoining: '2025-03-06',
        //   team: 'Hydra',
        // },
        // {
        //   id: 15,
        //   firstName: 'Rohan',
        //   lastName: 'Mehta',
        //   email: 'rohan.mehta@freshworks.com',
        //   dateOfJoining: '2025-03-11',
        //   team: 'Orion',
        // },
        // {
        //   id: 16,
        //   firstName: 'Aisha',
        //   lastName: 'Khan',
        //   email: 'aisha.khan@gm.com',
        //   dateOfJoining: '2025-03-16',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 17,
        //   firstName: 'Siddharth',
        //   lastName: 'Rao',
        //   email: 'siddharth.rao@freshworks.com',
        //   dateOfJoining: '2025-03-21',
        //   team: 'Phoenix',
        // },
        // {
        //   id: 18,
        //   firstName: 'Anya',
        //   lastName: 'Singhal',
        //   email: 'anya.singhal@gm.com',
        //   dateOfJoining: '2025-03-26',
        //   team: 'Hydra',
        // },
        // {
        //   id: 19,
        //   firstName: 'Dev',
        //   lastName: 'Malhotra',
        //   email: 'dev.malhotra@freshworks.com',
        //   dateOfJoining: '2025-03-31',
        //   team: 'Orion',
        // },
        // {
        //   id: 20,
        //   firstName: 'Riya',
        //   lastName: 'Chopra',
        //   email: 'riya.chopra@gm.com',
        //   dateOfJoining: '2025-04-05',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 21,
        //   firstName: 'Aarav',
        //   lastName: 'Nair',
        //   email: 'aarav.nair@freshworks.com',
        //   dateOfJoining: '2025-04-10',
        //   team: 'Phoenix',
        // },
        // {
        //   id: 22,
        //   firstName: 'Isha',
        //   lastName: 'Bhatia',
        //   email: 'isha.bhatia@gm.com',
        //   dateOfJoining: '2025-04-15',
        //   team: 'Hydra',
        // },
        // {
        //   id: 23,
        //   firstName: 'Kabir',
        //   lastName: 'Raina',
        //   email: 'kabir.raina@freshworks.com',
        //   dateOfJoining: '2025-04-20',
        //   team: 'Orion',
        // },
        // {
        //   id: 24,
        //   firstName: 'Meera',
        //   lastName: 'Saxena',
        //   email: 'meera.saxena@gm.com',
        //   dateOfJoining: '2025-04-25',
        //   team: 'Valkyrie',
        // },
        // {
        //   id: 25,
        //   firstName: 'Arjun',
        //   lastName: 'Tandon',
        //   email: 'arjun.tandon@freshworks.com',
        //   dateOfJoining: '2025-04-30',
        //   team: 'Phoenix',
        // },
      ].forEach((data) => {
        this.store.createRecord('user', data);
      });
    }
  }

  model() {
    const users = this.store.peekAll('user');

    return users;
  }
}
