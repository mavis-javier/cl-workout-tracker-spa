import { Component, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {HttpClient} from '@angular/common/http';

interface Greeting {
  id?: number;
  content?: string;
}

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class AppComponent {
  protected readonly title = 'Demo';
  greeting: Greeting = {};

  private http = inject(HttpClient); // inject is used to get an HttpClient service and use to GET /resource

  constructor() {
    this.http.get<Greeting>('resource').subscribe(data => this.greeting = data);
  }
}
