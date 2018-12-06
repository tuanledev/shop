package helper

import (
	"bytes"
	"fmt"
	"math/rand"
	"shop/models"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
	"github.com/disintegration/imaging"
	"golang.org/x/crypto/bcrypt"
)

func HashPassword(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	return string(bytes), err
}

func CheckPasswordHash(password, hash string) error {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err
}

func init() {
	rand.Seed(time.Now().UnixNano())
	PathHost = fmt.Sprintf("http://%s", beego.AppConfig.String("httphost"))
}

var letterRunes = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

func RandStringRunes(n int) string {
	b := make([]rune, n)
	for i := range b {
		b[i] = letterRunes[rand.Intn(len(letterRunes))]
	}
	return string(b)
}

func UnicodeToAscii(str string) string {
	var CharMap = map[string]string{
		"à": "a", "ô": "o", "ď": "d", "ḟ": "f", "ë": "e", "š": "s", "ơ": "o", "ß": "ss", "ă": "a", "ř": "r", "ț": "t", "ň": "n", "ā": "a", "ķ": "k", "ŝ": "s", "ỳ": "y", "ņ": "n", "ĺ": "l", "ħ": "h", "ṗ": "p", "ó": "o", "ú": "u", "ě": "e", "é": "e", "ç": "c", "ẁ": "w", "ċ": "c", "õ": "o", "ṡ": "s", "ø": "o", "ģ": "g", "ŧ": "t", "ș": "s", "ė": "e", "ĉ": "c", "ś": "s", "î": "i", "ű": "u", "ć": "c", "ę": "e", "ŵ": "w", "ṫ": "t", "ū": "u", "č": "c", "ö": "oe", "è": "e", "ŷ": "y", "ą": "a", "ł": "l", "ų": "u", "ů": "u", "ş": "s", "ğ": "g", "ļ": "l", "ƒ": "f", "ž": "z", "ẃ": "w", "ḃ": "b", "å": "a", "ì": "i", "ï": "i", "ḋ": "d", "ť": "t", "ŗ": "r", "ä": "ae", "í": "i", "ŕ": "r", "ê": "e", "ü": "ue", "ò": "o", "ē": "e", "ñ": "n", "ń": "n", "ĥ": "h", "ĝ": "g", "đ": "d", "ĵ": "j", "ÿ": "y", "ũ": "u", "ŭ": "u", "ư": "u", "ţ": "t", "ý": "y", "ő": "o", "â": "a", "ľ": "l", "ẅ": "w", "ż": "z", "ī": "i", "ã": "a", "ġ": "g", "ṁ": "m", "ō": "o", "ĩ": "i", "ù": "u", "į": "i", "ź": "z", "á": "a", "û": "u", "þ": "th", "ð": "dh", "æ": "ae", "µ": "u", "ĕ": "e", "ằ": "a", "ầ": "a", "ề": "e", "ồ": "o", "ừ": "u", "ả": "a", "ẳ": "a", "ẩ": "a", "ẻ": "e", "ể": "e", "ỉ": "i", "ỏ": "o", "ổ": "o", "ở": "o", "ủ": "u", "ử": "u", "ỷ": "y", "ẵ": "a", "ẫ": "a", "ẽ": "e", "ễ": "e", "ỗ": "o", "ỡ": "o", "ữ": "u", "ỹ": "y", "ắ": "a", "ấ": "a", "ế": "e", "ố": "o", "ớ": "o", "ứ": "u", "ạ": "a", "ặ": "a", "ậ": "a", "ẹ": "e", "ệ": "e", "ị": "i", "ọ": "o", "ờ": "o", "ộ": "o", "ợ": "o", "ụ": "u", "ự": "u", "ỵ": "y"}
	str = strings.ToLower(str)
	for k, v := range CharMap {
		str = strings.Replace(str, k, v, -1)
	}

	return str
}

func StrToAlias(str string) string {
	str = strings.TrimLeft(str, " ")
	str = strings.TrimRight(str, " ")
	for i := 0; i < 20; i++ {
		str = strings.Replace(str, "  ", " ", -1)
	}
	str = strings.TrimSpace(str)
	str = UnicodeToAscii(str)
	str = strings.Replace(str, " ", "-", -1)
	return str
}

func TitleStrimSpace(str string) string {
	str = strings.TrimLeft(str, " ")
	str = strings.TrimRight(str, " ")
	for i := 0; i < 20; i++ {
		str = strings.Replace(str, "  ", " ", -1)
	}
	return str
}

func CheckFileImage(contentType string) bool {
	if contentType == "image/gif" || contentType == "image/jpeg" || contentType == "image/pjpeg" || contentType == "image/png" || contentType == "image/jpg" {
		return true
	}
	return false
}

func ResizeImg(w int, h int, pathImg string) {
	src, _ := imaging.Open(pathImg)
	// Resize the cropped image to width = 200px preserving the aspect ratio.
	src = imaging.Resize(src, w, h, imaging.NearestNeighbor)
	imaging.Save(src, pathImg)
}

func FormatNameImg(contentType, alias string) string {
	typeImg := strings.Split(contentType, "/")
	fileName := fmt.Sprintf("%s-%v.%s", alias, time.Now().Unix(), typeImg[1])
	return fileName
}

func ShowCategory(menus []models.Category, parentID int, lang string, buffer *bytes.Buffer, level int) {
	cateChild := []models.Category{}
	// var buffer bytes.Buffer
	for _, menu := range menus {
		if menu.ParentID == parentID {
			cateChild = append(cateChild, menu)
		}
	}
	if len(cateChild) > 0 {
		if level > 0 {
			buffer.WriteString(`<ul class="sub-menu sub-menu-level">`)
		} else {
			buffer.WriteString(`<ul class="sub-menu">`)
		}
		level++
		for _, cate := range cateChild {
			switch lang {
			case "en-US":
				buffer.WriteString(fmt.Sprintf(`
					<li class="menu-item">
						<a href="%s/en/product/%v">%s</a>
				`, PathHost, cate.Id, cate.TitleEN))
				ShowCategory(menus, cate.Id, lang, buffer, level)
				buffer.WriteString("</li>")
			default:
				buffer.WriteString(fmt.Sprintf(`
					<li class="menu-item">
						<a href="%s/san-pham/%v">%s</a>
				`, PathHost, cate.Id, cate.TitleVN))
				ShowCategory(menus, cate.Id, lang, buffer, level)
				buffer.WriteString("</li>")
			}
		}
		buffer.WriteString("</ul>")
	}
}

func ShowCateNews(menus []models.CateNew, parentID int, lang string, buffer *bytes.Buffer, level int) {
	cateChild := []models.CateNew{}
	// var buffer bytes.Buffer
	for _, menu := range menus {
		if menu.ParentID == parentID {
			cateChild = append(cateChild, menu)
		}
	}
	if len(cateChild) > 0 {
		if level > 0 {
			buffer.WriteString(`<ul class="sub-menu sub-menu-level">`)
		} else {
			buffer.WriteString(`<ul class="sub-menu">`)
		}
		level++
		for _, cate := range cateChild {
			switch lang {
			case "en-US":
				buffer.WriteString(fmt.Sprintf(`
					<li class="menu-item">
						<a href="%s/en/blog/%v">%s</a>
				`, PathHost, cate.Id, cate.TitleEN))
				ShowCateNews(menus, cate.Id, lang, buffer, level)
				buffer.WriteString("</li>")
			default:
				buffer.WriteString(fmt.Sprintf(`
					<li class="menu-item">
						<a href="%s/tin-tuc/%v">%s</a>
				`, PathHost, cate.Id, cate.TitleVN))
				ShowCateNews(menus, cate.Id, lang, buffer, level)
				buffer.WriteString("</li>")
			}
		}
		buffer.WriteString("</ul>")
	}
}

func ParseUrl(url string) int {
	var id int
	urlStr := strings.Split(url, "-")
	if len(urlStr) > 0 {
		id, _ = strconv.Atoi(urlStr[len(urlStr)-1])
	}
	return id
}
