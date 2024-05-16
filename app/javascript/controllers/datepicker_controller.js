import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // this.element => whatever you put the controller on
    flatpickr(this.element);
  }
}
