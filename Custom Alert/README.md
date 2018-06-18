```
    @IBAction func showAlert(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController")
         vc?.modalPresentationStyle = .custom
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }
```