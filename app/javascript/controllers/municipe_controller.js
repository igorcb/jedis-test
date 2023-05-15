import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "zipcode", "street", "neighborhood", "city", "state", "code_ibge", "zipError" ]

  clearForm() {
    this.streetTarget.value = null
    this.neighborhoodTarget.value = null
    this.cityTarget.value = null
    this.stateTarget.value = null
    this.code_ibgeTarget.value = null
  }

  async search() {
    let zipcodeTemp = this.zipcodeTarget.value
    let zip_code = zipcodeTemp.replace(/\D/g, "")
    let validZipCode = /^[0-9]{8}$/

    if (!validZipCode.test(zip_code)) {
      this.zipErrorTarget.textContent = "Formato de CEP inválido."
      this.clearForm();
      return
    }

    const urlViaCep = `https://viacep.com.br/ws/${zip_code}/json/`
    const response = await fetch(urlViaCep)
    const data = await response.json();

    if (response.ok) {
      if (data.erro) {
        this.zipErrorTarget.textContent = "CEP não encontrado."
        this.clearForm();
        return 
      }

      this.streetTarget.value = data.logradouro
      this.neighborhoodTarget.value = data.bairro
      this.cityTarget.value = data.localidade
      this.stateTarget.value = data.uf
      this.code_ibgeTarget.value = data.ibge
      this.zipErrorTarget.textContent = null
    }
  }
}
