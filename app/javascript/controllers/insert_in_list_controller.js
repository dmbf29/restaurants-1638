import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["form", "reviews", "input"];

  connect() {
    console.log(this.formTarget);
    console.log(this.reviewsTarget);
  }

  send(event) {
    console.log("submitted!!!!");
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        // what do we want to get back??? => the new review (and form)
        if (data.review) {
          this.reviewsTarget.insertAdjacentHTML("afterbegin", data.review);
        }
        this.formTarget.outerHTML = data.form;
      });
  }
}
