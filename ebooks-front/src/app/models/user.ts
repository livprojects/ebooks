export class User {
  private _id: number
  private _role: Role
  private _mail: string
  private _password: string
  private _pseudo : string
  private _firstname: string
  private _lastname: string
  private _birthdate: Date
  private _description: string
  private _rank: string


  constructor(id: number, role: Role, mail: string, password: string, pseudo: string, firstname: string, lastname: string, birthdate: Date, description: string, rank: string) {
    this._id = id;
    this._role = role;
    this._mail = mail;
    this._password = password;
    this._pseudo = pseudo;
    this._firstname = firstname;
    this._lastname = lastname;
    this._birthdate = birthdate;
    this._description = description;
    this._rank = rank;
  }

  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get role(): Role {
    return this._role;
  }

  set role(value: Role) {
    this._role = value;
  }

  get mail(): string {
    return this._mail;
  }

  set mail(value: string) {
    this._mail = value;
  }

  get password(): string {
    return this._password;
  }

  set password(value: string) {
    this._password = value;
  }

  get pseudo(): string {
    return this._pseudo;
  }

  set pseudo(value: string) {
    this._pseudo = value;
  }

  get firstname(): string {
    return this._firstname;
  }

  set firstname(value: string) {
    this._firstname = value;
  }

  get lastname(): string {
    return this._lastname;
  }

  set lastname(value: string) {
    this._lastname = value;
  }

  get birthdate(): Date {
    return this._birthdate;
  }

  set birthdate(value: Date) {
    this._birthdate = value;
  }

  get description(): string {
    return this._description;
  }

  set description(value: string) {
    this._description = value;
  }

  get rank(): string {
    return this._rank;
  }

  set rank(value: string) {
    this._rank = value;
  }
}
