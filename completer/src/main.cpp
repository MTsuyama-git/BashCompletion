#include <iostream>
#include <vector>
#include <string>
#include <fstream>

int main(int argc, char** argv)
{
    std::vector<std::string> line_lists;

    std::fstream ifs("completion.lst", std::ios::in);
    if(ifs.is_open() == false) 
    {
        line_lists.push_back("sample1");
        line_lists.push_back("sample2");
    }
    else {
        std::string line;
        while(std::getline(ifs, line))
        {
            line_lists.push_back(line);
        }
        ifs.close();
    }

    for(auto& line : line_lists)
    {
        std::cout << line << " " << std::flush;
    }

    std::cout << std::endl;


    return 0;
}
