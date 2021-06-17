import { Component, OnInit } from '@angular/core';
import { Genre } from '../../models/genre';

@Component({
  selector: 'app-genre',
  templateUrl: './genre.component.html',
  styleUrls: ['./genre.component.css']
})

export class GenreComponent implements OnInit {

  

  constructor() { 
    // this.genre = new Genre(1, 'Fantastique')
   }

  ngOnInit(): void {
  }

}
