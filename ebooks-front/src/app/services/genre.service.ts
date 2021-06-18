import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class GenreService {

  constructor(private http: HttpClient) { }

  getAllGenres() : Observable<any>{
    console.log("Wadup")
  }
}
