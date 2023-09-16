$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxZTljOWYyNC02MDdhLTQ0ZjctYjNkMy1jMWNiYTMyNmJlMzYiLCJpYXQiOjE2OTMzMTMyMzUsInN1YiI6ImFkbWluaXN0cmF0b3JAdnNwaGVyZS5sb2NhbCIsImlzcyI6InZjZi1hdXRoIiwiYXVkIjoic2RkYy1zZXJ2aWNlcyIsIm5iZiI6MTY5MzMxMzIzNSwiZXhwIjoxNjkzMzE2ODM1LCJ1c2VyIjoiYWRtaW5pc3RyYXRvckB2c3BoZXJlLmxvY2FsIiwibmFtZSI6ImFkbWluaXN0cmF0b3JAdnNwaGVyZS5sb2NhbCIsInNjb3BlIjpbIlJFU09VUkNFX0ZVTkNUSU9OQUxJVFlfV1JJVEUiLCJMSUNFTlNJTkdfSU5GT19SRUFEIiwiU0REQ19GRURFUkFUSU9OX1dSSVRFIiwiQVZOX1dSSVRFIiwiU0REQ19NQU5BR0VSX1JFQUQiLCJDRVJUX1dSSVRFIiwiQ09NUE9TQUJJTElUWV9XUklURSIsIkxJQ0VOU0VfS0VZX1JFQUQiLCJDT01QT1NBQklMSVRZX1JFQUQiLCJFREdFX0NMVVNURVJfV1JJVEUiLCJVU0VSX1JFQUQiLCJDUkVERU5USUFMX1dSSVRFIiwiQkFDS1VQX0NPTkZJR19SRUFEIiwiQ0xVU1RFUl9XUklURSIsIkFWTl9SRUFEIiwiVkFTQV9QUk9WSURFUl9SRUFEIiwiRE9NQUlOX1dSSVRFIiwiQ0VJUF9SRUFEIiwiU09TX1dSSVRFIiwiU0REQ19NQU5BR0VSX1dSSVRFIiwiTlRQX1dSSVRFIiwiVEFHX1dSSVRFIiwiREVQT1RfQ09ORklHX1dSSVRFIiwiU1lTVEVNX1JFQUQiLCJERVBPVF9DT05GSUdfUkVBRCIsIkhPU1RfV1JJVEUiLCJSRVNPVVJDRV9MT0NLX1dSSVRFIiwiQkFDS1VQX1JFU1RPUkVfUkVBRCIsIkNFUlRfUkVBRCIsIlVTRVJfV1JJVEUiLCJVUEdSQURFX1JFQUQiLCJPVEhFUl9SRUFEIiwiTElDRU5TSU5HX1dSSVRFIiwiU09TX1JFQUQiLCJFVkVOVF9XUklURSIsIlNFQ1VSSVRZX0NPTkZJR19SRUFEIiwiQ1JFREVOVElBTF9SRUFEIiwiSE9TVF9SRUFEIiwiQ0VJUF9XUklURSIsIlJFU09VUkNFX0xPQ0tfUkVBRCIsIk9USEVSX1dSSVRFIiwiTElDRU5TRV9LRVlfV1JJVEUiLCJSRVNPVVJDRV9GVU5DVElPTkFMSVRZX1JFQUQiLCJDQV9SRUFEIiwiVEFHX1JFQUQiLCJMSUNFTlNJTkdfUkVBRCIsIk5FVFdPUktfUE9PTF9XUklURSIsIldDUF9SRUFEIiwiTElDRU5TSU5HX0lORk9fV1JJVEUiLCJCQUNLVVBfUkVTVE9SRV9XUklURSIsIk5UUF9SRUFEIiwiRURHRV9DTFVTVEVSX1JFQUQiLCJFVkVOVF9SRUFEIiwiQkFDS1VQX0NPTkZJR19XUklURSIsIldDUF9XUklURSIsIlNFUlZJQ0VfQUNDT1VOVF9XUklURSIsIk5FVFdPUktfUE9PTF9SRUFEIiwiQ0FfV1JJVEUiLCJDTFVTVEVSX1JFQUQiLCJWQVNBX1BST1ZJREVSX1dSSVRFIiwiRE5TX1dSSVRFIiwiU1lTVEVNX1dSSVRFIiwiVlJTTENNX1dSSVRFIiwiRE5TX1JFQUQiLCJTRVJWSUNFX0FDQ09VTlRfUkVBRCIsIlNERENfRkVERVJBVElPTl9SRUFEIiwiRE9NQUlOX1JFQUQiLCJWUlNMQ01fUkVBRCIsIlVQR1JBREVfV1JJVEUiXSwicm9sZSI6WyJBRE1JTiJdfQ.S1w6ErZ2B-Dv8FOf5528jkY_kOWqPI5ceBwxVFpWYGM")

$response = Invoke-RestMethod 'https://sddc-md-vcf0-ko.rainpole.dev/v1/credentials?resourceType=NSXT_MANAGER' -Method 'GET' -Headers $headers
$response | ConvertTo-Json