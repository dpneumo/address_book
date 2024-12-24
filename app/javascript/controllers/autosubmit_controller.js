import { Controller } from "@hotwired/stimulus"
import debounce from "debounce";

// Connects to data-controller="autosubmit"
export default class extends Controller {
  initialize() {
    this.submit = debounce(this.submit.bind(this), 500)
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
