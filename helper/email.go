package helper

import (
	"crypto/tls"
	"strings"

	"github.com/astaxie/beego"
	"gopkg.in/gomail.v2"
)

type Email struct {
	Subject    string
	Body       string
	From       string
	To         []string
	Cc         []string
	Attachment []string
}

func (em *Email) Send() error {

	if len(em.From) == 0 {
		em.From = beego.AppConfig.String("mail_user")
	}

	m := gomail.NewMessage()
	m.SetHeader("From", em.From)

	if strings.Contains(beego.AppConfig.String("runmode"), "prod") == true {
		m.SetHeader("To", em.To...)
		if len(em.Cc) > 0 {
			m.SetHeader("Cc", em.Cc...)
		}
	} else {
		m.SetHeader("To", beego.AppConfig.String("mail_to"))
	}
	m.SetHeader("Subject", em.Subject)
	m.SetBody("text/html", em.Body)
	if len(em.Attachment) > 0 {
		for i := 0; i < len(em.Attachment); i++ {
			m.Attach(em.Attachment[i])
		}
	}
	portMail, _ := beego.AppConfig.Int("mail_port")
	d := gomail.NewDialer(beego.AppConfig.String("mail_host"), portMail, beego.AppConfig.String("mail_user"), beego.AppConfig.String("mail_pass"))
	d.TLSConfig = &tls.Config{InsecureSkipVerify: true}
	// Send the email to Bob, Cora and Dan.
	if err := d.DialAndSend(m); err != nil {
		return err
	}
	return nil
}
