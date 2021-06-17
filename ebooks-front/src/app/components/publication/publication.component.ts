import { Component, OnInit } from '@angular/core';
import { Publication } from '../../models/publication.model';
import { PublicationService } from '../../services/publication.service';

@Component({
  selector: 'app-publication',
  templateUrl: './publication.component.html',
  styleUrls: ['./publication.component.css']
})
export class PublicationComponent implements OnInit {

  publications: any;

  constructor(
    private publicationService: PublicationService, 

  ) { }

  ngOnInit(): void {

    this.publicationService.getAllPublications().subscribe(res => {
      this.publications = res.results.books;
      console.log(res.results.books)
    });
  }

}
