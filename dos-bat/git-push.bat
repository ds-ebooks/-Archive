@echo off
cd C:\Users\Alien\Desktop\DOS-BAT\_book
echo "׼����ʼ���ֿ�..."
git init
echo "׼����ʼ���ֿ�...OK"

echo "���Զ�ֿ̲�..."
git remote add origin https://github.com/ds-ebooks/DOS-BAT.git
echo "���Զ�ֿ̲�...OK"

echo "���Զ�ֿ̲�...OK"
echo "��ʼ�ύ�����ļ�..."
git add . 
git commit -m "..."
echo "��ʼ�ύ�����ļ�...OK"

echo "�½����л����ط�֧..."
git branch gh-pages
git checkout gh-pages
echo "�½����л����ط�֧...OK"

echo "���ǿ��push..."
git push -u origin gh-pages -f
echo "���ǿ��push...OK"
pause