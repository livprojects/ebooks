import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Publication } from '../models/publication.model';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PublicationService {

  notsosecretkey = 'UDnkPGqdIuekh0mvLc4ps4cX7uG7Ah8u';
  url = `https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=${this.notsosecretkey}`;
  
  constructor(private http: HttpClient) { 
  
  }

  getAllPublications(): Observable<any> {
    return this.http.get<any>(this.url);
  }

}
