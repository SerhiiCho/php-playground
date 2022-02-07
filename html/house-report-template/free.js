const axios = require('axios')
const fs = require('fs')

const html = fs.readFileSync('./free.html', { encoding: 'utf-8' })
const css = fs.readFileSync('./style.css', { encoding: 'utf-8' })

axios.post('https://hub.nalog.nl/api/v1/generators/pdf-file', {
    token: 'KyJzdkIiOiIxMjM0NTYJODkwIiNibmFtzSI3IkpvaljM8MiDsfQ',
    content: html,
    css: css,
    is_public: true,
    dir_name: 'house-pdf-report',
    margin_top: 10,
    margin_bottom: 10,
})
    .then(res => console.log(res.data))
    .catch(err => console.error(err))