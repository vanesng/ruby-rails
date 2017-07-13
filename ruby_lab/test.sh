ruby lab.rb > my_output.txt

echo "Comparing your output with expected output:"
diff my_output.txt expected_output.txt
echo "If you see no console output above, you passed!"
echo "Otherwise, look at my_output.txt and expected_output.txt to debug."
