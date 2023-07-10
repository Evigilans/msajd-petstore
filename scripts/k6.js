import http from 'k6/http';
import {sleep} from 'k6';

export default function () {
    let resp = http.get('https://msajd-petstorepetservice.azurewebsites.net/api/cpu-load/');
    console.log(`response: "${resp.body}"`);
    sleep(1);
}