import { Genre } from './genre';

describe('Genre', () => {
  it('should create an instance', () => {
    expect(new Genre(1, "Fantastique")).toBeTruthy();
  });
});
