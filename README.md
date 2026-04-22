# WNH-INVENTORY

> **Why Not Hardware // E-Waste Rescue Inventory & Asset Tracker**

WNH-INVENTORY is a static, highly-dense asset inventory for the WNH lab. It tracks intercepted e-waste—ranging from legacy routers to analog displays—that has been salvaged for low-level systems engineering, kernel hacking, and custom compute projects.

## ⚙️ Architecture

* **Backend / SSG:** [Hugo](https://gohugo.io/) (Go-Templating)
* **Frontend:** Vanilla JS, HTML5 `<dialog>` for native lightboxing, and heavily stripped [Pico.css](https://picocss.com/) for structural tokens.
* **Database:** Markdown Leaf Bundles (YAML Front Matter).
* **Deployment:** Fully automated via GitHub Actions to GitHub Pages.

## 🚀 Live Environment

The inventory automatically compiles and deploys on every push to the `main` branch.
**View the live inventory here:** [https://WNH-Organization.github.io/WNH-INVENTORY](https://WNH-Organization.github.io/WNH-INVENTORY)

## 🛠️ Local Development

If you are modifying the UI, templates, or testing a complex Markdown entry, you can run the inventory locally.

**Prerequisites:**
* `hugo` (extended edition)
* `imagemagick` (required for compressing hardware photos)

**Spinning up the dev server:**
```bash
git clone [https://github.com/WNH-Organization/WNH-INVENTORY.git](https://github.com/WNH-Organization/WNH-INVENTORY.git)
cd WNH-INVENTORY
make dev
````

## 🤝 Contributing

Lab members, operators, and donors are encouraged to submit pull requests to log new hardware or claim existing hardware for a project.

**CRITICAL:** Please read **CONTRIBUTING.md** before submitting a pull request. We strictly enforce image compression to prevent repository bloat.
