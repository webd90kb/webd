- Embed the resource files(with directory structure) into the executable program. For C language.
- Detail: https://webd.cf/blogs/embed_files_into_executable_program.html

```bash
chmod +x embed_file_c.sh

./embed_file_c.sh dir2c_test
# or
./embed_file_c.sh dir2c /path/to/resource > _data_enc.c
gcc embed_file.c -o embed_file
./embed_file
```
