import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosubmit"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }
  submit(e) {
    const form = this.element;
    const formData = new FormData(form);

    const params = new URLSearchParams(formData);
    const newUrl = `${form.action}?${params.toString()}`;

    Turbo.visit(newUrl, { frame: "people" });
    history.pushState({}, "", newUrl);
  }
}
