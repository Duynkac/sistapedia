import 'package:sistapedia/contribution.dart';

class Contributions {
  List<Contribution> contributions;
  Contribution currentContribution;

  Contributions() {
    contributions = new List<Contribution>();
  }

  addContribution(Contribution contribution) {
    contributions.add(contribution);
  }

  List<Contribution> getContributions() {
    return contributions;
  }

  Contribution getContribution() {
    return currentContribution;
  }

  setContribution(Contribution contribution) {
    this.currentContribution = contribution;
  }

  int getLength() {
    return contributions.length;
  }
}
