#!/usr/bin/python
# This script generates a SQL script that inserts multiple users into the
# gidget database.
import random, crypt, time, sets
from passlib.hash import bcrypt

NUM_USERS = 240
NUM_CONDITIONS = 3

COMMON_PASS = "HelpGidget!"
VALID_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
ADJECTIVES = [
	"tested", "spiffy", "cool", "literate", "unique", "decisive", "robust", "great", "first", 
	"aquatic", "jaded", "well", "cold", "confident", "gamy", 
	"super", "living", "hurried", "thundering", "classy", "chilly", 
	"awesome", "fortunate", "vigorous", "wonderful", "distinct", "amazing", 
	"cheerful", "tense", "scientific", "simple", "fresh", "impossible", "charming", "miniature", "lively", "gifted",
	"superb", "splendid", "noble", "glorious", "elegant", "modest"
]
NOUNS = [
	"bat", "friends", "trail", "home", "talk", "move", "orange",
	"button", "plane", "volcano", "brake", "ground", "person", "cheese", "railway", "root", "writing", "car", "tray",
	"store", "debt", "mint", "squirrel", "steel", "thunder", "fruit",
	"stove", "shirt", "support", "basin", "grass", "mind", "ladybug",
	"clam", "throne", "geese", "toad", "glass", "ocean", "tree", "wind", "sand", "waves", "guide", "island", "sky", "wish"
]

def salt():
	salt = ""
	for i in range(0, 22):
		salt += VALID_CHARS[random.randint(0, len(VALID_CHARS) - 1)]
	return salt

# The javascript numberhashing function to unsure passwords are correctly hashed before encryption.
def numberhash(passw):
	hashed = 0
	if len(passw) == 0:
		return hashed
	for i in range(0, len(passw)):
		hashed = ((hashed << 5) - hashed) + ord(passw[i])
		hashed = hashed & hashed
	return hashed
f1 = open('all-users.csv', 'w')
f1.write("username\n")

f = open('all-users-data.rake', 'w')
f.write("namespace :db do\n")
f.write("  desc \"Fill users with user data\"\n")
f.write("  task :populateAllUsers => :environment do\n")

creation_time = time.time()
#hash_pass = crypt.crypt(str(numberhash(COMMON_PASS)), salt()) # Hash and encrypt the password
#crypt($password, sprintf('$2a$%02d$', 8) . $salt);
#ctype = "6" #for sha512 (see man crypt)
#salt = salt()
#insalt = '${}${}$'.format(ctype, salt)
#password = COMMON_PASS

#value1 = sha512_crypt.encrypt(password, salt=salt, rounds=5000)
#value2 = crypt.crypt(password, insalt)
#if not value1 == value2:
#    print("algorithms do not match")
#print("{}\n{}\n\n".format(value1, value2))
hash_pass = '$2a$08$V55VfBqNcZEhlYyliQgat.70HURPr33voO1Qmln9gRm7XRNLoRu4G';#bcrypt.encrypt(str(numberhash(COMMON_PASS)), salt=salt(), rounds=8)#value2

usernames = sets.Set()


for i in range(1, NUM_USERS + 1):
	while True:
		username = random.choice(ADJECTIVES) + random.choice(NOUNS) + str(random.randint(1,100))
		if username not in usernames:
			usernames.add(username)
			break

	email = "{}@gmail.com".format(username)
 	condition = (i - 1) % NUM_CONDITIONS
        if condition == 0:
            color = "blue"
        elif condition == 1:
            color = "orange"
        else:
            color = "gray"
	f.write("\n    User.create!(:first_name => '{}', :last_name => '{}', :email => '{}', :password => '{}', :color => '{}')".format(username, username, email, username, color))
	f1.write(username)
	f1.write("\n")
#f.write("""\n\t('{}', '{}', '{}', {}, {}, {})""".format(
#		username, hash_pass, email, creation_time, True, condition))
#	if i < NUM_USERS:
#		f.write("")

f.write("\n  end\n")
f.write("end\n")