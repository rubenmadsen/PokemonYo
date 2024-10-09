Welcome to your new dbt project!

### Using the starter project
## Installation
Bash
```bash
python3 -m venv .venv
. .venv/bin/activate
sudo chmod +x install.sh
sudo chmod +x update.sh
./install.sh
```
Edit crontab and add this line using ```crontab -e``` and add this line:
```crontab
0 0 * * * ./script.sh
```

## Graphs
```bash
.venv/bin/python3 visualizer.py
```



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
