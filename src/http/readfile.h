#include <fstream>  // std::ifstream
#include <iostream> // std::cout
class ReadFile {
public:
  ReadFile(const char *file) : filename_(file) {}
  char *Getbuff() {
    std::ifstream is(filename_, std::ifstream::binary);
    if (is) {
      // get length of file:
      is.seekg(0, is.end);
      int length = is.tellg();
      is.seekg(0, is.beg);

      buffer_ = new char[length];
      // read data as a block:
      is.read(buffer_, length);
      if (is)
        std::cout << "all characters read successfully." <<std::endl;
      else
        std::cout << "error: only " << is.gcount() << " could be read";
      is.close();

      return buffer_;
    } else {
      std::cout << "file: " << filename_ << "can't read!' " << std::endl;
      return nullptr;
    }
  }

  ~ReadFile() {
    if (!buffer_)
      delete[] buffer_;
  }

private:
  std::string filename_;
  char *buffer_ = nullptr;
};
